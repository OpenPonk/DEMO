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
	| project projectController |
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

	project := OPProject new.
	project addModel: model.
	projectController := OPProjectController forProject: project.

	diagramController := OPDemoController new.
	projectController addDiagramController: diagramController.
	canvasPresenter := OPCanvasPresenter new.
	canvasPresenter attachController: diagramController.
	diagramController diagramElement: (OPOpenPonkDiagram forModelElement: model).
	diagramController model: model.
	
	transactionController diagramController: diagramController.
	transactionController model: transactionModel.
	
	actorController diagramController: diagramController.
	actorController model: actorModel.
	
	executorLinkController diagramController: diagramController.
	executorLinkController model: executorLinkModel.

	diagramController showAllElements
]

{ #category : 'running' }
OPDemoLayouterTest >> testApplyLayout [

	^ OPDemoLayouter new
		  diagramController: diagramController;
		  applyLayout: [ :a :b |  ]
]

{ #category : 'tests' }
OPDemoLayouterTest >> testCarRentalDefaultLayoutIsUndoable [
	| layouter carRentalModel undoManager boundElements initialPositions |
	carRentalModel := OPDemoExamples exampleCarRental.
	diagramController model: carRentalModel.
	diagramController showAllElements.

	undoManager := diagramController undoManager.

	boundElements := (diagramController controllers
		select: [ :eachController | eachController diagramElement isKindOf: OPBoundNode ]
		thenCollect: #diagramElement) asSet.

	initialPositions := Dictionary new.
	boundElements do: [ :eachElement |
		eachElement roassalShape ifNotNil: [ :eachShape |
			initialPositions at: eachElement put: eachShape position copy ] ].

	layouter := OPDemoLayouter new diagramController: diagramController.
	layouter defaultLayout.

	self assert: undoManager canUndo.

	diagramController undo.

	boundElements do: [ :eachElement |
		eachElement roassalShape ifNotNil: [ :eachShape |
			self assert: eachShape position equals: (initialPositions at: eachElement) ] ]
]

{ #category : 'tests' }
OPDemoLayouterTest >> testCarRentalExampleDefaultLayout [
	| layouter carRentalModel |
	carRentalModel := OPDemoExamples exampleCarRental.
	diagramController model: carRentalModel.
	diagramController showAllElements.

	layouter := OPDemoLayouter new.
	layouter diagramController: diagramController.
	layouter defaultLayout
]

{ #category : 'tests' }
OPDemoLayouterTest >> testLayoutScopeOfInterestReturnsActor [
	| layouter carRentalModel scope actor |
	carRentalModel := OPDemoExamples exampleCarRental.
	diagramController model: carRentalModel.
	diagramController showAllElements.

	layouter := OPDemoLayouter new.
	layouter diagramController: diagramController.
	scope := carRentalModel getScopeOfInterest first.
	actor := layouter layoutScopeOfInterest: scope.

	self assert: (actor isKindOf: OPDemoInternalActor).
	self assert: actor name equals: 'A2'
]
