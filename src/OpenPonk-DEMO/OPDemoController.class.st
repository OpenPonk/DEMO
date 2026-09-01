"
Controller for the top-level DEMO CSD model. Manages the lifecycle of the entire diagram, applies layouts, initializes the palette, and coordinates top-level elements.
"
Class {
	#name : 'OPDemoController',
	#superclass : 'OPDiagramController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoController class >> viewModelClass [

	^ OPDemoViewModel
]

{ #category : 'userinterface' }
OPDemoController >> applyLayout: anAlgorithm [
	| roassalShapes edges |
	roassalShapes := self controllers
		           select: [ :each | each isKindOf: OPDemoElementController ]
		           thenCollect: [ :each | each roassalShape ].
	edges := (roassalShapes flatCollect: #connectedLines) reject: [ :each |
		         each from = each to ].
	anAlgorithm on: roassalShapes asGroup edges: edges asGroup
]

{ #category : 'connecting' }
OPDemoController >> canBeTargetFor: aController [
	^ (super canBeTargetFor: aController)
		or: [ aController isKindOf: OPDemoElementController ]
]

{ #category : 'accessing' }
OPDemoController >> controllerFactory [

	^ super controllerFactory
		  register: OPDemoScopeOfInterestController forModel: OPDemoScopeOfInterest;
   		  register: OPDemoCompositeActorController forModel: OPDemoCompositeActor;
		  register: OPDemoInternalActorController forModel: OPDemoInternalActor;
		  register: OPDemoStandardInternalTransactionController forModel: OPDemoStandardInternalTransaction;
		  register: OPDemoStandardCompositeTransactionController forModel: OPDemoStandardCompositeTransaction;
		  register: OPDemoMultipleInternalTransactionController forModel: OPDemoMultipleInternalTransaction;
		  register: OPDemoMultipleCompositeTransactionController forModel: OPDemoMultipleCompositeTransaction;
		  register: OPDemoAccessLinkController forModel: OPDemoAccessLink;
		  register: OPDemoSourceInitiatorLinkController forModel: OPDemoSourceInitiatorLink;
		  register: OPDemoTargetInitiatorLinkController forModel: OPDemoTargetInitiatorLink;
		  register: OPDemoWaitingLinkController forModel: OPDemoWaitingLink;
		  register: OPDemoLinkController forModel: OPDemoLink;
		  register: OPDemoFactsController forModel: OPDemoFacts
]

{ #category : 'ui interaction' }
OPDemoController >> initializePalette: aPalette [
	aPalette
		newCreationTool: 'Composite Actor'
			factory: [ OPDemoCompositeActorController new ]
			icon: OPDemoEditorIcons compositeActor16Icon;
		newCreationTool: 'Internal Actor'
			factory: [ OPDemoInternalActorController new ]
			icon: OPDemoEditorIcons actor16Icon ;
		newSeparator;
		newCreationTool: 'Transaction' 
			factory: [ OPDemoStandardInternalTransactionController new ] 
			icon: OPDemoEditorIcons transaction16Icon;
		newCreationTool: 'Composite Transaction' 
			factory: [ OPDemoStandardCompositeTransactionController new ] 
			icon: OPDemoEditorIcons compositeTransaction16Icon;
		newCreationTool: 'Multiple Transaction' 
			factory: [ OPDemoMultipleInternalTransactionController new ] 
			icon: OPDemoEditorIcons multipleTransaction16Icon;
		newCreationTool: 'Multiple Composite Transaction' 
			factory: [ OPDemoMultipleCompositeTransactionController new ] 
			icon: OPDemoEditorIcons multipleCompositeTransaction16Icon;
		newSeparator;
		newCreationTool: 'Facts'
			factory: [ OPDemoFactsController new ]
			icon: OPDemoEditorIcons facts16Icon ;
		newSeparator;
		newConnectionCreationTool: 'Access Link'
			factory: [ OPDemoAccessLinkController new ]
			icon: OPDemoEditorIcons accessLink16Icon;
		newConnectionCreationTool: 'Executor Link'
			factory: [ OPDemoSourceInitiatorLinkController new ]
			icon: OPDemoEditorIcons initiatorLink16Icon;
		newConnectionCreationTool: 'Initiator Link'
			factory: [ OPDemoTargetInitiatorLinkController new ]
			icon: OPDemoEditorIcons initiatorLinkTarget16Icon;
		newConnectionCreationTool: 'Waiting Link'
			factory: [ OPDemoWaitingLinkController new ]
			icon: OPDemoEditorIcons waitingLink16Icon;
		newSeparator;
		newCreationTool: 'Scope of interest'
			factory: [ OPDemoScopeOfInterestController new ]
			icon: OPDemoEditorIcons scopeOfInterest16Icon
]

{ #category : 'controllers management' }
OPDemoController >> newControllerFor: aModel [
	"IncomingTransition identifies itself as transition, but is not"
	
	^ super
		newControllerFor:
			(aModel isEdge
				ifTrue: [ aModel asEdge ]
				ifFalse: [ aModel ])
]
