Class {
	#name : 'OPDemoController',
	#superclass : 'OPDiagramController',
	#category : 'OpenPonk-DEMO-DiagramControllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramControllers'
}

{ #category : 'ui interaction' }
OPDemoController >> applyLayout: anAlgorithm [

	| roassalShapes edges |
	roassalShapes := self controllers
		           select: [ :each | each isKindOf: OPFsmVertexController ]
		           thenCollect: [ :each | each roassalShape ].
	edges := (roassalShapes flatCollect: #connectedLines) reject: [ :each |
		         each from = each to ].
	anAlgorithm on: roassalShapes asGroup edges: edges asGroup
]

{ #category : 'ui interaction' }
OPDemoController >> canBeTargetFor: aController [
	^ (super canBeTargetFor: aController)
		or: [ aController isKindOf: OPFsmVertexController ]
]

{ #category : 'ui interaction' }
OPDemoController >> commonModelClassPrefix [
	^ 'OPFsm'
]

{ #category : 'ui interaction' }
OPDemoController >> controllerFactory [

	^ super controllerFactory
		  register: OPFsmInitialStateController forModel: OPFsmInitialState;
		  register: OPFsmStateController forModel: OPFsmState;
		  register: OPFsmTransitionController forModel: OPFsmTransition
]

{ #category : 'ui interaction' }
OPDemoController >> elementsToShowInside [

	^ self model elements
]

{ #category : 'ui interaction' }
OPDemoController >> initializePalette: aPalette [
	aPalette
		newCreationTool: 'Actor'
			factory: [ OPDemoActorController new ]
			icon: OPDemoEditorIcons actor16Icon;
		newSeparator;
		newCreationTool: 'Transaction' 
			factory: [ OPDemoTransactionController new ] 
			icon: OPDemoEditorIcons transaction16Icon;
		newCreationTool: 'Scope of interest'
			factory: [ OPDemoScopeOfInterestController new ]
			icon: OPDemoEditorIcons scopeOfInterest16Icon;
		newSeparator;
		newConnectionCreationTool: 'Link'
			factory: [ OPDemoLinkController new ]
			icon: OPDemoEditorIcons initiatorLink16Icon 
]

{ #category : 'ui interaction' }
OPDemoController >> newControllerFor: aModel [
	"IncomingTransition identifies itself as transition, but is not"

	^ super
		newControllerFor:
			(aModel isTransition
				ifTrue: [ aModel asTransition ]
				ifFalse: [ aModel ])
]
