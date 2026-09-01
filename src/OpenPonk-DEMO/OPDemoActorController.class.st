"
Controller for DEMO Actor Roles. Manages diagram interactions, validates connections, and synchronizes the actor state with the view.
"
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

{ #category : 'connecting' }
OPDemoActorController >> canBeSourceFor: aController [
	((self model transactionCount = 1) and: (aController isKindOf: OPDemoSourceInitiatorLinkController )) ifTrue: [ ^ false ].
	(aController isKindOf: OPDemoSourceInitiatorLinkController ) ifTrue: [ 
		(self model edges select: [ :each | each isKindOf: OPDemoSourceInitiatorLink ]) isEmpty ifFalse: [ ^ false ].
		 ].

	^ (aController respondsTo: #modelClass) and:
	[aController modelClass = OPDemoAccessLink or:
	[(aController modelClass = OPDemoWaitingLink) or:
	[(aController modelClass = OPDemoTargetInitiatorLink) or: 
	[(aController modelClass = OPDemoSourceInitiatorLink)]]]]
]

{ #category : 'connecting' }
OPDemoActorController >> canBeTargetFor: aController [

	((aController isKindOf: OPDemoStandardInternalTransactionController)
		 and: self model transactionCount = 0) ifTrue: [ ^ true ].
	(super canBeTargetFor: aController) ifFalse: [ ^ false ].
	(aController isKindOf: OPDemoWaitingLinkController) ifTrue: [
		^ aController source isKindOf: OPDemoTransactionController ].
	((aController isKindOf: OPDemoTargetInitiatorLinkController) or:
		 (aController isKindOf: OPDemoSourceInitiatorLinkController))
		ifFalse: [ ^ true ].
	^ aController source isKindOf: OPDemoTransactionController
]

{ #category : 'construction' }
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
OPDemoActorController >> nodeRoassalShapes [

	^ self model transactions
		  collect: [ :eachModel | 
			  self diagramController
				  controllerForModel: eachModel
				  ifFound: #roassalShape ]
		  thenSelect: #isNotNil
]

{ #category : 'diagram elements' }
OPDemoActorController >> unhookDiagramElement [

	super unhookDiagramElement.
	(self diagramElement ifNotExists: [ ^ self ])
		innerRoassalShapesBlock: [  ]
]
