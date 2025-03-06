Class {
	#name : 'OPDemoController',
	#superclass : 'OPDiagramController',
	#category : 'OpenPonk-DEMO-DiagramControllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramControllers'
}

{ #category : 'ui interaction' }
OPDemoController >> initializePalette: aPalette [
	aPalette
		newCreationTool: 'Actor'
			factory: [ OPDemoActorController new ]
			icon: OPCoreIcons opFsmInitialStateIcon;
		newSeparator;
		newCreationTool: 'Transaction' 
			factory: [ OPDemoTransactionController new ] 
			icon: OPCoreIcons opFsmRegularStateIcon;
		newCreationTool: 'Scope of interest'
			factory: [ OPDemoScopeOfInterestController new ]
			icon: OPCoreIcons opFsmFinalStateIcon;
		newSeparator;
		newConnectionCreationTool: 'Link'
			factory: [ OPDemoLinkController new ]
			icon: OPCoreIcons opFsmTransitionIcon
]
