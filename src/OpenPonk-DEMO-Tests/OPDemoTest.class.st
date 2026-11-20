"
Unit tests for the DEMO CSD model lifecycle.
Verifies the addition and removal of elements, as well as dependency resolution within the DEMO environment.
"
Class {
	#name : 'OPDemoTest',
	#superclass : 'TestCase',
	#instVars : [
		'diagram',
		'scopeOfInterest',
		'compositeActor',
		'factBank',
		'multipleCompositeTransaction',
		'standardInternalTransactionA',
		'internalActor',
		'accessLink',
		'standardInternalTransactionB'
	],
	#category : 'OpenPonk-DEMO-Tests-Models',
	#package : 'OpenPonk-DEMO-Tests',
	#tag : 'Models'
}

{ #category : 'running' }
OPDemoTest >> setUp [ 
	super setUp.
	diagram := OPDemo named: 'TestDiagram'.
	scopeOfInterest := OPDemoScopeOfInterest named: 'TestScopeOfInterest'.
	compositeActor := OPDemoCompositeActor named: 'TestCompositeActor'.
	factBank := OPDemoFacts named: 'TestFactBank'.
	multipleCompositeTransaction := OPDemoMultipleCompositeTransaction named: 'TestMultipleCompositeTransaction'.
	standardInternalTransactionA := OPDemoStandardInternalTransaction named: 'TestStandardInternalTransactionA'.
	internalActor := OPDemoInternalActor named: 'TestInternalActor'.
	accessLink := OPDemoAccessLink from: factBank to: scopeOfInterest named: 'TestAccessLink'.
	standardInternalTransactionB := OPDemoStandardInternalTransaction named: 'TestStandardInternalTransactionB'.
]

{ #category : 'tests' }
OPDemoTest >> testActorPredicates [

	self assert: compositeActor isComposite description: 'Composite actor must report isComposite = true'.
	self deny: compositeActor isInternal description: 'Composite actor must report isInternal = false'.
	self deny: internalActor isComposite description: 'Internal actor must report isComposite = false'.
	self assert: internalActor isInternal description: 'Internal actor must report isInternal = true'
]

{ #category : 'running' }
OPDemoTest >> testAdd [
	"checking if the initialization causes an empty diagram"

	self assertEmpty: diagram elements.
	"adding a scope of interest"
	diagram add: scopeOfInterest.
	self assert: diagram elements size equals: 1.
	self assert: diagram elements first identicalTo: scopeOfInterest.
	self assert: diagram elements first class identicalTo: OPDemoScopeOfInterest.
	self assert: diagram elements first name asString equals: 'TestScopeOfInterest'.
	"adding a composite actor role, fact bank and a multiple composite transaction"
	diagram add: compositeActor.
	diagram add: factBank.
	diagram add: multipleCompositeTransaction.
	self assert: diagram elements size equals: 4.
	self assertCollection: diagram ownedElements hasSameElements: (Array
			 with: scopeOfInterest
			 with: compositeActor
			 with: factBank
			 with: multipleCompositeTransaction).
	"adding elements into scope of interest"
	scopeOfInterest add: standardInternalTransactionA.
	scopeOfInterest add: internalActor.
	self
		assertCollection: scopeOfInterest ownedElements
		hasSameElements: (Array with: standardInternalTransactionA with: internalActor).
	"adding a link"
	diagram add: accessLink.
	self assert: (diagram elements at: 5) equals: accessLink.
	self assertCollection: factBank outgoing hasSameElements: (Array with: accessLink).
	self assertCollection: scopeOfInterest incoming hasSameElements: (Array with: accessLink).
	"testing a transaction inside an actor role"
	self assertEmpty: internalActor elements.
	self
		deny: internalActor hasTransaction
		description: 'Internal actor without child transactions must report hasTransaction = false'.
	internalActor add: standardInternalTransactionB.
	self assertCollection: internalActor ownedElements hasSameElements: (Array with: standardInternalTransactionB).
	self
		assert: internalActor hasTransaction
		description: 'Internal actor containing a transaction must report hasTransaction = true'
]

{ #category : 'tests' }
OPDemoTest >> testDiagramNodeAndEdgePredicates [

	self deny: diagram isEdge description: 'Root DEMO diagram must not be an edge'.
	self deny: diagram isNode description: 'Root DEMO diagram must not be a node'
]

{ #category : 'tests' }
OPDemoTest >> testEmptyModelExample [

	| emptyModel |
	emptyModel := OPDemoExamples emptyModel.
	self assert: emptyModel class identicalTo: OPDemo.
	self assert: emptyModel name equals: 'New DEMO diagram'.
	self assertEmpty: emptyModel elements
]

{ #category : 'tests' }
OPDemoTest >> testLinkPredicates [

	| sourceInitiatorLink targetInitiatorLink waitingLink |
	sourceInitiatorLink := OPDemoSourceInitiatorLink new.
	targetInitiatorLink := OPDemoTargetInitiatorLink new.
	waitingLink := OPDemoWaitingLink new.

	self assert: accessLink isAccess description: 'Access link must report isAccess = true'.
	self deny: accessLink isInitiator description: 'Access link must report isInitiator = false'.
	self deny: accessLink isSourceInitiator description: 'Access link must report isSourceInitiator = false'.
	self deny: accessLink isTargetInitiator description: 'Access link must report isTargetInitiator = false'.
	self deny: accessLink isWaiting description: 'Access link must report isWaiting = false'.

	self deny: sourceInitiatorLink isAccess description: 'Source initiator link must report isAccess = false'.
	self assert: sourceInitiatorLink isInitiator description: 'Source initiator link must report isInitiator = true'.
	self assert: sourceInitiatorLink isSourceInitiator description: 'Source initiator link must report isSourceInitiator = true'.
	self deny: sourceInitiatorLink isTargetInitiator description: 'Source initiator link must report isTargetInitiator = false'.
	self deny: sourceInitiatorLink isWaiting description: 'Source initiator link must report isWaiting = false'.

	self deny: targetInitiatorLink isAccess description: 'Target initiator link must report isAccess = false'.
	self assert: targetInitiatorLink isInitiator description: 'Target initiator link must report isInitiator = true'.
	self deny: targetInitiatorLink isSourceInitiator description: 'Target initiator link must report isSourceInitiator = false'.
	self assert: targetInitiatorLink isTargetInitiator description: 'Target initiator link must report isTargetInitiator = true'.
	self deny: targetInitiatorLink isWaiting description: 'Target initiator link must report isWaiting = false'.

	self deny: waitingLink isAccess description: 'Waiting link must report isAccess = false'.
	self deny: waitingLink isInitiator description: 'Waiting link must report isInitiator = false'.
	self deny: waitingLink isSourceInitiator description: 'Waiting link must report isSourceInitiator = false'.
	self deny: waitingLink isTargetInitiator description: 'Waiting link must report isTargetInitiator = false'.
	self assert: waitingLink isWaiting description: 'Waiting link must report isWaiting = true'
]

{ #category : 'running' }
OPDemoTest >> testRemoveDependencies [

	self testAdd.
	self assertCollection: diagram ownedElements hasSameElements: (Array
			 with: scopeOfInterest
			 with: compositeActor
			 with: factBank
			 with: multipleCompositeTransaction
			 with: accessLink).
	self
		assertCollection: scopeOfInterest ownedElements
		hasSameElements: (Array with: standardInternalTransactionA with: internalActor).
	self assertCollection: internalActor ownedElements hasSameElements: (Array with: standardInternalTransactionB).
	scopeOfInterest remove.
	self assert: scopeOfInterest owner identicalTo: nil.
	self assert: standardInternalTransactionB owner identicalTo: nil.
	self assert: internalActor owner identicalTo: nil.
	self assert: standardInternalTransactionA owner identicalTo: nil.
	self assert: accessLink source identicalTo: nil.
	self assert: accessLink target identicalTo: nil.
	self
		assertCollection: diagram ownedElements
		hasSameElements: (Array with: compositeActor with: factBank with: multipleCompositeTransaction).
	compositeActor remove.
	factBank remove.
	multipleCompositeTransaction remove.
	self assertEmpty: diagram elements
]

{ #category : 'running' }
OPDemoTest >> testRemoveSequential [

	self testAdd.
	self assertCollection: diagram ownedElements hasSameElements: (Array
			 with: scopeOfInterest
			 with: compositeActor
			 with: factBank
			 with: multipleCompositeTransaction
			 with: accessLink).
	self
		assertCollection: scopeOfInterest ownedElements
		hasSameElements: (Array with: standardInternalTransactionA with: internalActor).
	self assertCollection: internalActor ownedElements hasSameElements: (Array with: standardInternalTransactionB).
	self
		assert: internalActor hasTransaction
		description: 'Internal actor containing standardInternalTransactionB must report hasTransaction = true'.

	standardInternalTransactionB remove.
	self assertEmpty: internalActor elements.
	self
		deny: internalActor hasTransaction
		description: 'Internal actor after removing its only transaction must report hasTransaction = false'.
	self assert: standardInternalTransactionB owner identicalTo: nil.
	internalActor remove.
	self assertCollection: scopeOfInterest ownedElements hasSameElements: (Array with: standardInternalTransactionA).
	self assert: internalActor owner identicalTo: nil.
	standardInternalTransactionA remove.
	self assertEmpty: scopeOfInterest elements.
	self assert: standardInternalTransactionA owner identicalTo: nil.
	accessLink remove.
	self assert: accessLink source identicalTo: nil.
	self assert: accessLink target identicalTo: nil.
	self assertEmpty: factBank outgoing.
	self assertEmpty: scopeOfInterest incoming.
	multipleCompositeTransaction remove.
	factBank remove.
	compositeActor remove.
	scopeOfInterest remove.
	self assertEmpty: diagram elements
]

{ #category : 'tests' }
OPDemoTest >> testRootOwnerWithoutOwnerReturnsSelf [

	| detachedActor |
	detachedActor := OPDemoInternalActor named: 'Detached'.
	self assert: detachedActor rootOwner identicalTo: detachedActor.
	diagram add: scopeOfInterest.
	scopeOfInterest add: detachedActor.
	self assert: detachedActor rootOwner identicalTo: diagram
]

{ #category : 'tests' }
OPDemoTest >> testTransactionPredicates [

	| standardCompositeTransaction multipleInternalTransaction |
	standardCompositeTransaction := OPDemoStandardCompositeTransaction new.
	multipleInternalTransaction := OPDemoMultipleInternalTransaction new.

	self deny: standardInternalTransactionA isComposite description: 'Standard internal transaction must not be composite'.
	self deny: standardInternalTransactionA isMultiple description: 'Standard internal transaction must not be multiple'.

	self assert: standardCompositeTransaction isComposite description: 'Standard composite transaction must be composite'.
	self deny: standardCompositeTransaction isMultiple description: 'Standard composite transaction must not be multiple'.

	self deny: multipleInternalTransaction isComposite description: 'Multiple internal transaction must not be composite'.
	self assert: multipleInternalTransaction isMultiple description: 'Multiple internal transaction must be multiple'.

	self assert: multipleCompositeTransaction isComposite description: 'Multiple composite transaction must be composite'.
	self assert: multipleCompositeTransaction isMultiple description: 'Multiple composite transaction must be multiple'
]

{ #category : 'tests' }
OPDemoTest >> testTransactionTypeColors [

	standardInternalTransactionA type: 'Ontological'.
	self assert: standardInternalTransactionA typeColor equals: Color red.

	standardInternalTransactionA type: 'Informational'.
	self assert: standardInternalTransactionA typeColor equals: Color green.

	standardInternalTransactionA type: 'Documental'.
	self assert: standardInternalTransactionA typeColor equals: Color blue.

	standardInternalTransactionA type: 'Material'.
	self assert: standardInternalTransactionA typeColor equals: Color black
]
