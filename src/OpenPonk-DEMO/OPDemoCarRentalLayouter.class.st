"
A specialized diagram layouter that positions elements in the DEMO Car Rental example model.
"
Class {
	#name : 'OPDemoCarRentalLayouter',
	#superclass : 'OPDemoLayouter',
	#category : 'OpenPonk-DEMO-Plugin',
	#package : 'OpenPonk-DEMO',
	#tag : 'Plugin'
}

{ #category : 'layouts' }
OPDemoCarRentalLayouter >> defaultLayout [
	| allTargetNodes snapshot commands |
	allTargetNodes := self allRenderedNodeShapes.
	snapshot := OPDiagramGeometrySnapshot onNodes: allTargetNodes.

	self layoutDiagramExample: diagramController model.

	commands := snapshot deltaCommands.
	self executeLayoutCommands: commands.
	self updateCanvas
]

{ #category : 'processing' }
OPDemoCarRentalLayouter >> layoutCompositeActorExample: aNode [
	| actions |
	actions := {
		('CA1' -> [ :controller :element |
			controller roassalShape position: -546 @ -6.
			element labelFirst position: -546 @ -6.
			element labelSecond position: -546 @ 36 ]).
		('CA2' -> [ :controller :element |
			controller roassalShape position: 569 @ -43; height: 243.
			element labelFirst position: 569 @ -43.
			element labelSecond position: 569 @ 70 ]).
		('CA3' -> [ :controller :element |
			controller roassalShape position: 569 @ 157.
			element labelFirst position: 569 @ 157.
			element labelSecond position: 569 @ 199 ]).
		('CA4' -> [ :controller :element |
			controller roassalShape position: -546 @ 139.
			element labelFirst position: -546 @ 139.
			element labelSecond position: -546 @ 181 ]) } asDictionary.

	actions at: aNode name ifPresent: [ :action |
		| nodeController |
		nodeController := diagramController controllerForModel: aNode.
		action value: nodeController value: nodeController diagramElement ]
]

{ #category : 'processing' }
OPDemoCarRentalLayouter >> layoutDiagramExample: aDiagram [
	| scope compositeActors facts actorA2 scopeController directScopeShapes |
	scope := aDiagram getScopeOfInterest first.
	actorA2 := self layoutScopeOfInterest: scope.
	compositeActors := aDiagram getCompositeActors.
	compositeActors do: [ :eachActor | self layoutNode: eachActor ].
	facts := aDiagram getFacts.
	facts do: [ :eachFact | self layoutNode: eachFact ].
	self updateCanvas.
	actorA2 ifNotNil: [ self updateActor: actorA2 ].
	scopeController := diagramController controllerForModel: scope.
	directScopeShapes := scopeController diagramElement directNodeRoassalShapes.
	directScopeShapes ifNotEmpty: [
		scopeController diagramElement adaptBoundsToInnerBounds: directScopeShapes encompassingRectangle ].
	self updateCanvas
]

{ #category : 'processing' }
OPDemoCarRentalLayouter >> layoutFactsExample: aNode [
	| positions |
	positions := {
		('AT1' -> (-101 @ -396)).
		('AT2' -> (236 @ -396)).
		('AT3' -> (67 @ -396)) } asDictionary.

	positions at: aNode name ifPresent: [ :mainPos |
		| nodeController element |
		nodeController := diagramController controllerForModel: aNode.
		element := nodeController diagramElement.
		nodeController roassalShape position: mainPos + (8 @ 0).
		element attachedCircle position: mainPos.
		element attachedSquare position: mainPos.
		element labelFirst position: mainPos.
		element labelSecond position: mainPos + (2 @ -30) ]
]

{ #category : 'processing' }
OPDemoCarRentalLayouter >> layoutInternalActorExample: aNode [
	| actions |
	actions := {
		'A1' -> [ :controller :element |
			controller roassalShape position: -246 @ 67; height: 247.
			element labelFirst position: -246 @ 67.
			element labelSecond position: -246 @ 182 ].
		'A6' -> [ :controller :element |
			controller roassalShape position: -246 @ -144.
			element labelFirst position: -246 @ -144.
			element labelSecond position: -246 @ -102 ].
		'A3' -> [ :controller :element |
			controller roassalShape position: 254 @ 23; height: 373.
			element labelFirst position: 254 @ 23.
			element labelSecond position: 254 @ 202 ].
		'A2' -> [ :controller :element |
			controller roassalShape position: 75 @ -144; width: 150; height: 137.
			element labelFirst position: 75 @ -193.
			element labelSecond position: 75 @ -84.
			self layoutTransactionInsideActorExample: aNode ]
	} asDictionary.

	actions at: aNode name ifPresent: [ :action |
		| nodeController |
		nodeController := diagramController controllerForModel: aNode.
		action value: nodeController value: nodeController diagramElement ]
]

{ #category : 'processing' }
OPDemoCarRentalLayouter >> layoutNode: aNode [
	(aNode isKindOf: OPDemoInternalActor) ifTrue: [ ^ self layoutInternalActorExample: aNode ].
	(aNode isKindOf: OPDemoStandardInternalTransaction) ifTrue: [ ^ self layoutStandardInternalTransactionExample: aNode ].
	(aNode isKindOf: OPDemoCompositeActor) ifTrue: [ ^ self layoutCompositeActorExample: aNode ].
	(aNode isKindOf: OPDemoFacts) ifTrue: [ ^ self layoutFactsExample: aNode ]
]

{ #category : 'processing' }
OPDemoCarRentalLayouter >> layoutScopeOfInterest: aScope [
	| scopeController directShapes |
	scopeController := diagramController controllerForModel: aScope.
	aScope elements do: [ :eachModel | self layoutNode: eachModel ].
	directShapes := scopeController diagramElement directNodeRoassalShapes.
	directShapes ifNotEmpty: [
		scopeController diagramElement adaptBoundsToInnerBounds: directShapes encompassingRectangle ].
	^ aScope elements
		detect: [ :any | (any isKindOf: OPDemoInternalActor) and: [ any name = 'A2' ] ]
		ifNone: [ nil ]
]

{ #category : 'processing' }
OPDemoCarRentalLayouter >> layoutStandardInternalTransactionExample: aNode [
	| nodeController positions |
	positions := {
		('T1' -> (-392 @ -6)).
		('T2' -> (-392 @ 139)).
		('T3' -> (409 @ -114)).
		('T4' -> (409 @ 23)).
		('T5' -> (409 @ 157)).
		('T6' -> (-93 @ -144)) } asDictionary.

	positions at: aNode name ifPresent: [ :targetPosition |
		| element |
		nodeController := diagramController controllerForModel: aNode.
		element := nodeController diagramElement.
		nodeController roassalShape position: targetPosition.
		element attachedSquare position: targetPosition.
		element labelFirst position: targetPosition ]
]

{ #category : 'processing' }
OPDemoCarRentalLayouter >> layoutTransactionInsideActorExample: aNode [
	| transactionController |
	self updateCanvas.
	transactionController := diagramController controllerForModel: aNode elements first.
	transactionController roassalShape position: 75 @ -132.
	self updateCanvas.
	transactionController diagramElement attachedSquare position: 75 @ -132.
	self updateCanvas.
	transactionController diagramElement labelFirst position: 75 @ -132.
	self updateCanvas
]

{ #category : 'processing' }
OPDemoCarRentalLayouter >> updateActor: actorA2 [
	| actorController directShapes |
	actorController := diagramController controllerForModel: actorA2.
	actorController diagramElement labelFirst position: 75 @ -193.
	self layoutTransactionInsideActorExample: actorA2.
	directShapes := actorController diagramElement directNodeRoassalShapes.
	directShapes ifNotEmpty: [
		actorController diagramElement adaptBoundsToInnerBounds: directShapes encompassingRectangle ]
]
