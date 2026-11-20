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
	#category : 'OpenPonk-DEMO-Tests-Plugin',
	#package : 'OpenPonk-DEMO-Tests',
	#tag : 'Plugin'
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
OPDemoLayouterTest >> tearDown [

	canvasPresenter := nil.
	diagramController := nil.
	transactionController := nil.
	actorController := nil.
	executorLinkController := nil.
	model := nil.
	transactionModel := nil.
	actorModel := nil.
	executorLinkModel := nil.
	super tearDown
]

{ #category : 'tests' }
OPDemoLayouterTest >> testActorEncompassesExecutedTransactionsAfterDefaultLayout [

	| layouter carRentalModel actorBounds innerShapes |
	carRentalModel := OPDemoExamples exampleCarRental.
	diagramController model: carRentalModel.
	diagramController showAllElements.

	layouter := OPDemoLayouter new diagramController: diagramController.
	layouter defaultLayout.

	actorController := diagramController controllers detect: [ :eachController |
		                   (eachController isKindOf: OPDemoActorController) and: [ eachController model name = 'A2' ] ].
	actorBounds := actorController roassalShape encompassingRectangle.
	innerShapes := actorController diagramElement innerNodeRoassalShapes.
	self assert: innerShapes size equals: 1.
	innerShapes do: [ :eachNodeShape |
			| nodeBounds |
			nodeBounds := eachNodeShape encompassingRectangle.
			self assert: (actorBounds intersect: nodeBounds) equals: nodeBounds ]
]

{ #category : 'tests' }
OPDemoLayouterTest >> testApplyLayout [

	| passedBoxes passedEdges actorShape transactionShape linkShape |
	passedBoxes := nil.
	passedEdges := nil.
	OPDemoLayouter new
		diagramController: diagramController;
		applyLayout: [ :topBoxes :topEdges |
				passedBoxes := topBoxes.
				passedEdges := topEdges ].
	actorShape := (diagramController controllerForModel: actorModel) roassalShape.
	transactionShape := (diagramController controllerForModel: transactionModel) roassalShape.
	linkShape := (diagramController controllerForModel: executorLinkModel) roassalShape.
	self assert: diagramController controllers size equals: 3.
	self assertCollection: passedBoxes hasSameElements: {
			actorShape.
			transactionShape }.
	self assertCollection: passedEdges hasSameElements: { linkShape }.
	self deny: diagramController undoManager canUndo description: 'No-op layout block must not push undo commands onto undoManager'
]

{ #category : 'tests' }
OPDemoLayouterTest >> testCarRentalDefaultLayoutIsUndoable [

	| layouter carRentalModel undoManager boundElements initialPositions compositeActorModel compositeActorShape |
	carRentalModel := OPDemoExamples exampleCarRental.
	diagramController model: carRentalModel.
	diagramController showAllElements.

	undoManager := diagramController undoManager.

	boundElements := (diagramController controllers
		                  select: [ :eachController | eachController diagramElement isKindOf: OPBoundNode ]
		                  thenCollect: #diagramElement) asSet.
	self denyEmpty: boundElements.

	initialPositions := Dictionary new.
	boundElements do: [ :eachElement |
			| eachShape |
			eachShape := eachElement roassalShape.
			self assertCollection: diagramController canvas shapes includesAll: { eachShape }.
			initialPositions at: eachElement put: eachShape position copy ].

	layouter := OPDemoLayouter new diagramController: diagramController.
	layouter defaultLayout.

	self assert: undoManager canUndo description: 'Default layout must push an undoable command'.
	self assert: undoManager undoStack size equals: 1.
	compositeActorModel := carRentalModel elements detect: [ :eachElement | eachElement name = 'CA1' ].
	compositeActorShape := (diagramController controllerForModel: compositeActorModel) roassalShape.
	self assert: compositeActorShape position equals: -546 @ -6.

	diagramController undo.

	self deny: undoManager canUndo description: 'Undoing default layout must exhaust the undo stack'.
	self assertEmpty: undoManager undoStack.
	boundElements do: [ :eachElement |
			| eachShape |
			eachShape := eachElement roassalShape.
			self assertCollection: diagramController canvas shapes includesAll: { eachShape }.
			self assert: eachShape position equals: (initialPositions at: eachElement) ]
]

{ #category : 'tests' }
OPDemoLayouterTest >> testCarRentalExampleDefaultLayout [

	| layouter carRentalModel scopeModel actorModelA1 actorModelA2 transactionModelT7 factsModelAT1 canvasBounds |
	carRentalModel := OPDemoExamples exampleCarRental.
	diagramController model: carRentalModel.
	diagramController showAllElements.

	layouter := OPDemoLayouter new.
	layouter diagramController: diagramController.
	layouter defaultLayout.

	self
		assert: (diagramController controllers count: [ :eachController | eachController model rootOwner == carRentalModel ])
		equals: 34.
	self assert: diagramController controllers size equals: 37.
	self denyEmpty: diagramController canvas shapes.

	scopeModel := carRentalModel getScopeOfInterest first.
	actorModelA1 := scopeModel elements detect: [ :eachElement | eachElement name = 'A1' ].
	actorModelA2 := scopeModel elements detect: [ :eachElement | eachElement name = 'A2' ].
	transactionModelT7 := actorModelA2 elements first.
	factsModelAT1 := carRentalModel getFacts detect: [ :eachElement | eachElement name = 'AT1' ].
	canvasBounds := diagramController canvas encompassingRectangle.

	{
		((carRentalModel elements detect: [ :eachElement | eachElement name = 'CA1' ]) -> (-546 @ -6)).
		(actorModelA1 -> (-246 @ 67)).
		(actorModelA2 -> (75 @ -132)).
		(transactionModelT7 -> (75 @ -132)).
		(factsModelAT1 -> (-93 @ -396)) } do: [ :eachPair |
			| elementShape elementBounds |
			elementShape := (diagramController controllerForModel: eachPair key) roassalShape.
			self assert: elementShape position equals: eachPair value.
			elementBounds := elementShape encompassingRectangle.
			self assert: (canvasBounds intersect: elementBounds) equals: elementBounds ]
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

	self assert: actor class identicalTo: OPDemoInternalActor.
	self assert: actor identicalTo: (scope elements detect: [ :eachElement | eachElement name = 'A2' ]).
	self assert: actor name equals: 'A2'
]

{ #category : 'tests' }
OPDemoLayouterTest >> testLayoutScopeOfInterestReturnsNilWithoutActorA2 [

	| genericModel genericScope genericActor project projectController testDiagramController layouter result |
	genericModel := OPDemo named: 'WithoutA2'.
	genericScope := OPDemoScopeOfInterest named: 'Scope'.
	genericActor := OPDemoInternalActor named: 'A1'.
	genericModel add: genericScope.
	genericScope add: genericActor.

	project := OPProject named: 'Test Project'.
	project addModel: genericModel.
	projectController := OPProjectController forProject: project.
	testDiagramController := OPDemoController new.
	projectController addDiagramController: testDiagramController.
	testDiagramController
		canvasPresenter: OPHeadlessCanvasPresenter new;
		diagramElement: (OPOpenPonkDiagram forModelElement: genericModel);
		model: genericModel.
	testDiagramController showAllElements.

	layouter := OPDemoLayouter new diagramController: testDiagramController.
	result := layouter layoutScopeOfInterest: genericScope.

	self assert: result identicalTo: nil
]

{ #category : 'tests' }
OPDemoLayouterTest >> testPluginRepositoryName [

	self assert: OPDemoPlugin repositoryName equals: #demo
]

{ #category : 'tests' }
OPDemoLayouterTest >> testScopeOfInterestEncompassesInnerElementsAfterDefaultLayout [

	| layouter carRentalModel scopeController scopeBounds innerShapes |
	carRentalModel := OPDemoExamples exampleCarRental.
	diagramController model: carRentalModel.
	diagramController showAllElements.

	layouter := OPDemoLayouter new diagramController: diagramController.
	layouter defaultLayout.

	scopeController := diagramController controllers detect: [ :eachController |
		                   eachController isKindOf: OPDemoScopeOfInterestController ].
	scopeBounds := scopeController roassalShape encompassingRectangle.
	innerShapes := scopeController diagramElement innerNodeRoassalShapes.
	self assert: innerShapes size equals: 10.
	innerShapes do: [ :eachNodeShape |
			| nodeBounds |
			nodeBounds := eachNodeShape encompassingRectangle.
			self assert: (scopeBounds intersect: nodeBounds) equals: nodeBounds ]
]

{ #category : 'tests' }
OPDemoLayouterTest >> testScopeOfInterestEncompassesInnerElementsInGenericDiagram [

	| genericModel genericScope genericActor genericTx project projectController testDiagController layouter scopeController scopeBounds innerShapes |
	genericModel := OPDemo new name: 'GenericSystemModel'.
	genericScope := OPDemoScopeOfInterest new name: 'SystemBoundary'.
	genericActor := OPDemoInternalActor new name: 'WorkerActor'.
	genericTx := OPDemoStandardInternalTransaction new name: 'TaskTx'.

	genericModel add: genericScope.
	genericScope add: genericActor.
	genericScope add: genericTx.

	project := OPProject new.
	project addModel: genericModel.
	projectController := OPProjectController forProject: project.
	projectController instVarNamed: #undoManager put: OPUndoManager new.

	testDiagController := OPDemoController new.
	projectController addDiagramController: testDiagController.
	testDiagController
		canvasPresenter: (OPCanvasPresenter new
				 canvas: RSCanvas new;
				 yourself);
		diagramElement: (OPOpenPonkDiagram forModelElement: genericModel);
		model: genericModel.

	testDiagController showAllElements.

	layouter := OPDemoLayouter new diagramController: testDiagController.
	layouter defaultLayout.

	scopeController := testDiagController controllerForModel: genericScope.
	scopeBounds := scopeController roassalShape encompassingRectangle.
	innerShapes := scopeController diagramElement innerNodeRoassalShapes.
	self assert: innerShapes size equals: 2.
	innerShapes do: [ :eachNodeShape |
			| nodeBounds |
			nodeBounds := eachNodeShape encompassingRectangle.
			self assert: (scopeBounds intersect: nodeBounds) equals: nodeBounds ]
]
