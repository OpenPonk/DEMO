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
	super setUp.
	transactionController := OPDemoStandardInternalTransactionController new.
	actorController := OPDemoInternalActorController new.
	executorLinkController := OPDemoSourceInitiatorLinkController new.
	model := OPDemo new.
	transactionModel := OPDemoStandardInternalTransaction new.
	actorModel := OPDemoInternalActor new.
	executorLinkModel := OPDemoSourceInitiatorLink from: actorModel to: transactionModel.
	model
		add: transactionModel;
		add: actorModel;
		add: executorLinkModel.
	diagramController := OPDemoController new.
	canvasPresenter := OPCanvasPresenter new.
	canvasPresenter attachController: diagramController.
	diagramController diagramElement:
		(OPOpenPonkDiagram forModelElement: model).
	diagramController model: model.
	transactionController model: transactionModel.
	actorController model: actorModel.
	executorLinkController model: executorLinkModel.
	diagramController showAllElements
]

{ #category : 'running' }
OPDemoLayouterTest >> testBasicApplyLayout [

	^ OPDemoLayouter new
		  diagramController: diagramController;
		  basicApplyLayout: [ :a :b |  ]
]
