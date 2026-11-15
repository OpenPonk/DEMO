"
Tests diagram-level controller behaviors, transaction creation, and links in DEMO diagrams.
"
Class {
	#name : 'OPDemoControllerTest',
	#superclass : 'OPAbstractDiagramControllerTest',
	#category : 'OpenPonk-DEMO-Tests-Controllers',
	#package : 'OpenPonk-DEMO-Tests',
	#tag : 'Controllers'
}

{ #category : 'constants' }
OPDemoControllerTest >> controllerClass [

	^ OPDemoController
]

{ #category : 'constants' }
OPDemoControllerTest >> diagramModelClass [

	^ OPDemo
]

{ #category : 'constants' }
OPDemoControllerTest >> modelClass [

	^ OPDemo
]

{ #category : 'tests' }
OPDemoControllerTest >> testControllerFactory [

	| factory |
	factory := controller controllerFactory.
	self assert: factory class identicalTo: OPControllerFactory.
	{
		(OPDemoCompositeActor -> OPDemoCompositeActorController).
		(OPDemoInternalActor -> OPDemoInternalActorController).
		(OPDemoStandardCompositeTransaction -> OPDemoStandardCompositeTransactionController).
		(OPDemoMultipleCompositeTransaction -> OPDemoMultipleCompositeTransactionController).
		(OPDemoStandardInternalTransaction -> OPDemoStandardInternalTransactionController).
		(OPDemoMultipleInternalTransaction -> OPDemoMultipleInternalTransactionController).
		(OPDemoFacts -> OPDemoFactsController).
		(OPDemoScopeOfInterest -> OPDemoScopeOfInterestController).
		(OPDemoAccessLink -> OPDemoAccessLinkController).
		(OPDemoSourceInitiatorLink -> OPDemoSourceInitiatorLinkController).
		(OPDemoTargetInitiatorLink -> OPDemoTargetInitiatorLinkController).
		(OPDemoWaitingLink -> OPDemoWaitingLinkController) } do: [ :eachPair |
			| instance |
			instance := eachPair key new.
			self
				assert: (factory hasControllerFor: instance)
				description: ('Controller factory must register {1}' format: { eachPair key name }).
			self assert: (factory newControllerFor: instance) class identicalTo: eachPair value ].
	self deny: (factory hasControllerFor: OPDemo new) description: 'Controller factory must not register diagram model OPDemo'
]

{ #category : 'tests' }
OPDemoControllerTest >> testInitializePalette [

	| palette entryLabels |
	palette := OPPalette new.
	controller initializePalette: palette.
	self assert: palette items size equals: 18.
	entryLabels := palette items select: [ :eachItem | eachItem class == OPPaletteEntry ] thenCollect: #label.
	self
		assert: entryLabels asArray
		equals:
			#( 'Select' 'Composite Actor' 'Internal Actor' 'Transaction' 'Composite Transaction' 'Multiple Transaction'
			   'Multiple Composite Transaction' 'Facts' 'Access Link' 'Executor Link' 'Initiator Link' 'Waiting Link' 'Scope of interest' )
]
