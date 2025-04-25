Class {
	#name : 'OPDemoActorController',
	#superclass : 'OPDemoElementController',
	#instVars : [
		'transactionCount'
	],
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoActorController >> buildEditorForm: aForm [
	|text|
	text := self model labelActor.
	super buildEditorForm: aForm.

	(aForm addText: 'Name')
		text: text;
		whenTextChangedDo: [ :newValue |
			self model labelActor: newValue.
			self modelChanged ]
]

{ #category : 'accessing' }
OPDemoActorController >> canBeSourceFor: aController [
	((self model transactionCount = 1) and: (aController isKindOf: OPDemoSourceInitiatorLinkController )) ifTrue: [ ^ false ].
	(aController isKindOf: OPDemoSourceInitiatorLinkController ) ifTrue: [ 
		(self model edges collect: [ :each | each isKindOf: OPDemoSourceInitiatorLinkController ]) isEmpty ifFalse: [ ^ false ].
		 ].

	^ (aController respondsTo: #modelClass) and:
	[aController modelClass = OPDemoAccessLink or:
	[(aController modelClass = OPDemoWaitingLink) or:
	[(aController modelClass = OPDemoTargetInitiatorLink) or: 
	[(aController modelClass = OPDemoSourceInitiatorLink)]]]]
]

{ #category : 'accessing' }
OPDemoActorController >> canBeTargetFor: aController [
	((aController isKindOf: OPDemoStandardInternalTransactionController) and: (self model transactionCount = 0)) ifTrue: [ ^ true ]. 
	(super canBeTargetFor: aController) ifFalse: [^ false].
	(aController isKindOf: OPDemoWaitingLinkController) ifTrue: [ (aController source isKindOf: OPDemoTransactionController ) ifTrue: [ ^ true ] ifFalse: [ ^ false ]].
	((aController isKindOf: OPDemoTargetInitiatorLinkController) or: (aController isKindOf: OPDemoSourceInitiatorLinkController)) ifFalse: [ ^ true ].
	^ aController source isKindOf: OPDemoTransactionController
]

{ #category : 'construction' }
OPDemoActorController >> dependentElements [

	^ (self model incoming , self model outgoing , self model elements) asSet
]

{ #category : 'construction' }
OPDemoActorController >> diagramElementClass [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
OPDemoActorController >> elementsToShowInside [

	^ self model elements
]

{ #category : 'accessing' }
OPDemoActorController >> hookDiagramElement [

	super hookDiagramElement.

	self diagramElement innerRoassalShapesBlock: [
		self nodeRoassalShapes ]
]

{ #category : 'initialization' }
OPDemoActorController >> initialize [
	super initialize.
	transactionCount := 0
]

{ #category : 'accessing' }
OPDemoActorController >> modelClass [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
OPDemoActorController >> nodeRoassalShapes [

	^ self model transactions
		  collect: [ :eachModel | 
			  self diagramController
				  controllerForModel: eachModel
				  ifFound: #roassalShape ]
		  thenSelect: #isNotNil
]

{ #category : 'accessing' }
OPDemoActorController >> removeModel [

	(self model elements) do: [ :each | each removeModel ].

	super removeModel
]
