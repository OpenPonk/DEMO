"
Unit tests for OPDemoLayouter.
Verifies the correct application of automated layouts to DEMO diagrams, transactions, and actor roles.
"
Class {
	#name : 'OPDemoLayouterTest',
	#superclass : 'TestCase',
	#instVars : [
		'diagramController',
		'transactionController',
		'actorController',
		'executorLinkController',
		'model',
		'transactionModel',
		'actorModel',
		'executorLinkModel',
		'canvasPresenter'
	],
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'running' }
OPDemoLayouterTest >> setUp [
    | project |
    super setUp.
    transactionController := OPDemoStandardInternalTransactionController new.
    actorController := OPDemoInternalActorController new.
    executorLinkController := OPDemoSourceInitiatorLinkController new.
    
    model := OPDemo new.
    transactionModel := OPDemoStandardInternalTransaction new.
    actorModel := OPDemoInternalActor new.
    executorLinkModel := OPDemoSourceInitiatorLink
        from: actorModel
        to: transactionModel.
    model
        add: transactionModel;
        add: actorModel;
        add: executorLinkModel.

    "Create a dummy project to break the circular initialization dependency"
    project := OPProject new.

    diagramController := OPDemoController new.
    canvasPresenter := OPCanvasPresenter new.
    canvasPresenter attachController: diagramController.
    diagramController diagramElement: (OPOpenPonkDiagram forModelElement: model).
    
    diagramController viewModelRegistry: (OPViewModelRegistry forProject: project).
    diagramController model: model.
    
    transactionController viewModelRegistry: diagramController viewModelRegistry.
    transactionController model: transactionModel.
    
    actorController viewModelRegistry: diagramController viewModelRegistry.
    actorController model: actorModel.
    
    executorLinkController viewModelRegistry: diagramController viewModelRegistry.
    executorLinkController model: executorLinkModel.

    diagramController showAllElements
]

{ #category : 'running' }
OPDemoLayouterTest >> testApplyLayout [

	^ OPDemoLayouter new
		  diagramController: diagramController;
		  applyLayout: [ :a :b |  ]
]
