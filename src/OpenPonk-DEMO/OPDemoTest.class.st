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
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
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

{ #category : 'running' }
OPDemoTest >> testAdd [
	"checking if the initialization causes an empty diagram"
	self assert: diagram elements isEmpty.
	"adding a scope of interest"
	diagram add: scopeOfInterest.
	self assert: diagram elements size equals: 1.
	self assert: ((diagram elements at: 1) isKindOf: OPDemoScopeOfInterest).
	self assert: ((diagram elements at: 1) name asString) equals: 'TestScopeOfInterest'.
	"adding a composite actor role, fact bank and a multiple composite transaction"
	diagram add: compositeActor.
	diagram add: factBank.
	diagram add: multipleCompositeTransaction.
	self assert: diagram elements size equals: 4.
	self assertCollection: diagram ownedElements hasSameElements: (Array with: scopeOfInterest with: compositeActor with: factBank with: multipleCompositeTransaction ).
	"adding elements into scope of interest"
	scopeOfInterest add: standardInternalTransactionA.
	scopeOfInterest add: internalActor.
	self assertCollection: scopeOfInterest ownedElements hasSameElements: (Array with: standardInternalTransactionA with: internalActor ).
	"adding a link"
	diagram add: accessLink.
	self assert: (diagram elements at: 5) equals: accessLink.
	self assertCollection: factBank outgoing hasSameElements: (Array with: accessLink ).
	self assertCollection: scopeOfInterest incoming hasSameElements: (Array with: accessLink ).
	"testing a transaction inside an actor role"
	self assert: internalActor hasTransaction not.
	internalActor add: standardInternalTransactionB.
	self assertCollection: internalActor ownedElements hasSameElements: (Array with: standardInternalTransactionB ).
	self assert: internalActor hasTransaction.
]

{ #category : 'running' }
OPDemoTest >> testRemoveDependencies [
	self testAdd.
	self assertCollection: diagram ownedElements hasSameElements: (Array with: scopeOfInterest with: compositeActor with: factBank with: multipleCompositeTransaction with: accessLink ).
	self assertCollection: scopeOfInterest ownedElements hasSameElements: (Array with: standardInternalTransactionA with: internalActor ).
	self assertCollection: internalActor ownedElements hasSameElements: (Array with: standardInternalTransactionB ).
	
	scopeOfInterest remove.
	self assert: scopeOfInterest owner isNil.
	self assert: standardInternalTransactionB owner isNil.
	self assert: internalActor owner isNil.
	self assert: standardInternalTransactionA owner isNil.
	self assert: accessLink source isNil.
	self assert: accessLink target isNil.
	self assertCollection: diagram ownedElements hasSameElements: (Array with: compositeActor with: factBank with: multipleCompositeTransaction ).
]

{ #category : 'running' }
OPDemoTest >> testRemoveSequential [
	self testAdd.
	self assertCollection: diagram ownedElements hasSameElements: (Array with: scopeOfInterest with: compositeActor with: factBank with: multipleCompositeTransaction with: accessLink ).
	self assertCollection: scopeOfInterest ownedElements hasSameElements: (Array with: standardInternalTransactionA with: internalActor ).
	self assertCollection: internalActor ownedElements hasSameElements: (Array with: standardInternalTransactionB ).
	self assert: internalActor hasTransaction.
	
	standardInternalTransactionB remove.
	self assert: internalActor hasTransaction not.
	self assert: standardInternalTransactionB owner isNil.
	internalActor remove.
	self assertCollection: scopeOfInterest ownedElements hasSameElements: (Array with: standardInternalTransactionA).
	self assert: internalActor owner isNil.
	standardInternalTransactionA remove.
	self assert: scopeOfInterest elements size equals: 0.
	self assert: standardInternalTransactionA owner isNil.
	accessLink remove.
	self assert: accessLink source isNil.
	self assert: accessLink target isNil.
	self assert: factBank outgoing isEmpty.
	self assert: scopeOfInterest incoming isEmpty.	
	multipleCompositeTransaction remove.
	factBank remove.
	compositeActor remove.
	scopeOfInterest remove.
	self assert: diagram elements isEmpty.
]
