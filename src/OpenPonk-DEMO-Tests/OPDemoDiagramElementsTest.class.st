"
Headless rendering and interaction tests for DEMO diagram elements, covering multiline labels, self-loop link shapes, transaction type colors, and nested draggable container shapes.
"
Class {
	#name : 'OPDemoDiagramElementsTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-DEMO-Tests-DiagramElements',
	#package : 'OpenPonk-DEMO-Tests',
	#tag : 'DiagramElements'
}

{ #category : 'tests' }
OPDemoDiagramElementsTest >> testActorAndScopeSelectionDraggableIncludesInnerShapes [

	| demoModel scope actor transaction project projectController diagramController scopeShape actorShape transactionShape scopeDragged actorDragged |
	demoModel := OPDemo named: 'Demo'.
	scope := OPDemoScopeOfInterest named: 'Scope'.
	actor := OPDemoInternalActor named: 'A1'.
	transaction := OPDemoStandardInternalTransaction named: 'T1'.
	demoModel add: scope.
	scope add: actor.
	actor add: transaction.

	project := OPProject named: 'Test Project'.
	project addModel: demoModel.
	projectController := OPProjectController forProject: project.
	diagramController := OPDemoController new.
	projectController addDiagramController: diagramController.
	diagramController
		canvasPresenter: OPHeadlessCanvasPresenter new;
		diagramElement: (OPOpenPonkDiagram forModelElement: demoModel);
		model: demoModel.
	diagramController showAllElements.

	scopeShape := (diagramController controllerForModel: scope) diagramElement.
	actorShape := (diagramController controllerForModel: actor) diagramElement.
	transactionShape := (diagramController controllerForModel: transaction) diagramElement.

	actorDragged := (actorShape roassalShape propertyAt: OPRSSelectionDraggable) shapesToDragInside: actorShape roassalShape.
	self assertCollection: actorDragged includesAll: { transactionShape roassalShape }.

	scopeDragged := (scopeShape roassalShape propertyAt: OPRSSelectionDraggable) shapesToDragInside: scopeShape roassalShape.
	self assertCollection: scopeDragged includesAll: { actorShape roassalShape }
]

{ #category : 'tests' }
OPDemoDiagramElementsTest >> testLinkShapeRendersBezierForSelfLoopAndPolylineOtherwise [

	| canvas actorA actorB shapeA shapeB selfLoopLink normalLink |
	canvas := RSCanvas new.
	actorA := OPDemoInternalActor named: 'A1'.
	actorB := OPDemoInternalActor named: 'A2'.
	shapeA := OPDemoInternalActorShape new modelElement: actorA.
	shapeB := OPDemoInternalActorShape new modelElement: actorB.
	shapeA renderIn: canvas.
	shapeB renderIn: canvas.

	selfLoopLink := OPDemoAccessLinkShape new
		                modelElement: (OPDemoAccessLink from: actorA to: actorA);
		                source: shapeA;
		                target: shapeA;
		                yourself.
	selfLoopLink renderIn: canvas.
	self assert: selfLoopLink roassalShape class identicalTo: OPRSBezier.

	normalLink := OPDemoAccessLinkShape new
		              modelElement: (OPDemoAccessLink from: actorA to: actorB);
		              source: shapeA;
		              target: shapeB;
		              yourself.
	normalLink renderIn: canvas.
	self assert: normalLink roassalShape class identicalTo: OPRSPolyline
]

{ #category : 'tests' }
OPDemoDiagramElementsTest >> testTransactionShapeUpdatesBorderColorFromTypeColor [

	| canvas transaction shape |
	canvas := RSCanvas new.
	transaction := OPDemoStandardInternalTransaction named: 'T1'.
	shape := OPDemoStandardInternalTransactionShape new modelElement: transaction.
	shape renderIn: canvas.
	self assert: shape attachedSquare borderColor equals: Color red.

	transaction type: 'Informational'.
	shape updateRenderFromModel.
	self assert: shape attachedSquare borderColor equals: Color green.

	transaction type: 'Documental'.
	shape updateRenderFromModel.
	self assert: shape attachedSquare borderColor equals: Color blue.

	transaction type: 'Material'.
	shape updateRenderFromModel.
	self assert: shape attachedSquare borderColor equals: Color black
]

{ #category : 'tests' }
OPDemoDiagramElementsTest >> testUpdateMultilineLabelHandlesNilEmptyAndMultilineText [

	| shape composite |
	shape := OPDemoInternalActorShape new.
	composite := RSComposite new.

	shape
		updateMultilineLabel: composite
		withText: nil
		fontSize: 12
		bold: false.
	self assert: composite children size equals: 1.
	self assert: composite children first text equals: ''.

	shape
		updateMultilineLabel: composite
		withText: ''
		fontSize: 12
		bold: false.
	self assert: composite children size equals: 1.
	self assert: composite children first text equals: ''.

	shape
		updateMultilineLabel: composite
		withText: (String cr join: #( 'Line 1' 'Line 2' ))
		fontSize: 12
		bold: true.
	self assert: composite children size equals: 2.
	self assert: (composite children collect: #text as: Array) equals: #( 'Line 1' 'Line 2' )
]
