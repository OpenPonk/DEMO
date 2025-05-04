"
I include information about all the elements present

I represent a layout
"
Class {
	#name : 'OPDemoLayouter',
	#superclass : 'OPLayouter',
	#category : 'OpenPonk-DEMO-Plugin',
	#package : 'OpenPonk-DEMO',
	#tag : 'Plugin'
}

{ #category : 'accessing' }
OPDemoLayouter >> allEdges [
	^ diagramController controllers
		select: [ :ctrl | (ctrl isKindOf: OPDemoAccessLinkController )
			or: [(ctrl isKindOf: OPDemoSourceInitiatorLinkController)  
			or: [(ctrl isKindOf: OPDemoTargetInitiatorLinkController)
			or: [(ctrl isKindOf: OPDemoWaitingLinkController )]]]]
		thenCollect: #roassalShape
]

{ #category : 'accessing' }
OPDemoLayouter >> allNodes [
	^ diagramController controllers
		select: [ :ctrl | (ctrl isKindOf: OPDemoCompositeActorController)
			or: [(ctrl isKindOf: OPDemoInternalActorController)  
			or: [(ctrl isKindOf: OPDemoScopeOfInterestController)
			or: [(ctrl isKindOf: OPDemoStandardCompositeTransactionController )
			or: [(ctrl isKindOf: OPDemoStandardInternalTransactionController )
			or: [(ctrl isKindOf: OPDemoMultipleCompositeTransactionController )
			or: [(ctrl isKindOf: OPDemoMultipleInternalTransactionController )
			or: [(ctrl isKindOf: OPDemoFactsController )]]]]]]]]
		thenCollect: #roassalShape
]

{ #category : 'layouts' }
OPDemoLayouter >> defaultLayout [
	(diagramController model name = 'Car Rental Example')
		ifTrue: [ self layoutDiagramExample: diagramController model ]
		ifFalse: self gridLayout
]

{ #category : 'as yet unclassified' }
OPDemoLayouter >> layoutCompositeActorExample: aNode [
	|nodeController|
	nodeController := diagramController controllerForModel: aNode.
	aNode name = 'CA1' ifTrue: [ 
			nodeController roassalShape position: (Point x:(-546) y:(-6)).
			(nodeController diagramElement labelFirst) position: (Point x:(-546) y:(-6)).
			(nodeController diagramElement labelSecond) position: (Point x:(-546) y:(36)).
			].
	aNode name = 'CA2' ifTrue: [ 
			nodeController roassalShape position: (Point x:569 y:(-43)).
			nodeController roassalShape height: 243.
			(nodeController diagramElement labelFirst) position: (Point x:569 y:(-43)).
			(nodeController diagramElement labelSecond) position: (Point x:569 y:70).
			].
	aNode name = 'CA3' ifTrue: [ 
			nodeController roassalShape position: (Point x:569 y:157).
			(nodeController diagramElement labelFirst) position: (Point x:569 y:157).
			(nodeController diagramElement labelSecond) position: (Point x:569 y:199).
			].
	aNode name = 'CA4' ifTrue: [ 
			nodeController roassalShape position: (Point x:(-546) y:139).
			(nodeController diagramElement labelFirst) position: (Point x:(-546) y:139).
			(nodeController diagramElement labelSecond) position: (Point x:(-546) y:181).
			].
]

{ #category : 'layouts' }
OPDemoLayouter >> layoutDiagramExample: aDiagram [
	|scope compositeActors facts actorA2|
	scope := (aDiagram getScopeOfInterest at: 1).
	actorA2 := self layoutScopeOfInterest: scope.
	compositeActors := (aDiagram getCompositeActors).
	compositeActors do: [ :each | self layoutNode: each].
	facts := (aDiagram getFacts).
	facts do: [ :each | self layoutNode: each].
	self updateCanvas.
	self updateActor: actorA2.
	self updateCanvas.
]

{ #category : 'as yet unclassified' }
OPDemoLayouter >> layoutFactsExample: aNode [
	|nodeController|
	nodeController := diagramController controllerForModel: aNode.
	aNode name = 'AT1' ifTrue: [ 
			nodeController roassalShape position: (Point x:(-93) y:(-396)).
			nodeController diagramElement attachedCircle position: (Point x:(-101) y:(-396)).
			nodeController diagramElement attachedSquare position: (Point x:(-101) y:(-396)).
			(nodeController diagramElement labelFirst) position: (Point x:(-101) y:(-396)).
			(nodeController diagramElement labelSecond) position: (Point x:(-99) y:(-426)).
			].
	aNode name = 'AT2' ifTrue: [ 
			nodeController roassalShape position: (Point x:(244) y:(-396)).
			nodeController diagramElement attachedCircle position: (Point x:(236) y:(-396)).
			nodeController diagramElement attachedSquare position: (Point x:(236) y:(-396)).
			(nodeController diagramElement labelFirst) position: (Point x:(236) y:(-396)).
			(nodeController diagramElement labelSecond) position: (Point x:(238) y:(-426)).
			].
	aNode name = 'AT3' ifTrue: [ 
			nodeController roassalShape position: (Point x:(75) y:(-396)).
			nodeController diagramElement attachedCircle position: (Point x:(67) y:(-396)).
			nodeController diagramElement attachedSquare position: (Point x:(67) y:(-396)).
			(nodeController diagramElement labelFirst) position: (Point x:(67) y:(-396)).
			(nodeController diagramElement labelSecond) position: (Point x:(69) y:(-426)).
			].
]

{ #category : 'as yet unclassified' }
OPDemoLayouter >> layoutInternalActorExample: aNode [
	|nodeController|
	nodeController := diagramController controllerForModel: aNode.
	aNode name = 'A1' ifTrue: [ 
			nodeController roassalShape position: (Point x:(-246) y:67).
			nodeController roassalShape height: 247.
			(nodeController diagramElement labelFirst) position: (Point x:(-246) y:67).
			(nodeController diagramElement labelSecond) position: (Point x:(-246) y:182).
			].
	aNode name = 'A6' ifTrue: [ 
			nodeController roassalShape position: (Point x:(-246) y:(-144)).
			(nodeController diagramElement labelFirst) position: (Point x:(-246) y:(-144)).
			(nodeController diagramElement labelSecond) position: (Point x:(-246) y:(-102)).
			].
	aNode name = 'A3' ifTrue: [ 
			nodeController roassalShape position: (Point x:254 y:23).
			(nodeController diagramElement labelFirst) position: (Point x:254 y:23).
			nodeController roassalShape height: 373.
			(nodeController diagramElement labelSecond) position: (Point x:254 y:202).
			].
	aNode name = 'A2' ifTrue: [ 
			nodeController roassalShape position: (Point x:75 y:(-144)).
			(nodeController diagramElement labelFirst) position: (Point x:75 y:(-193)).
			nodeController roassalShape width: 150.
			nodeController roassalShape height: 137.
			(nodeController diagramElement labelSecond) position: (Point x:75 y:(-84)).
			self layoutTransactionInsideActorExample: aNode.
			].
]

{ #category : 'as yet unclassified' }
OPDemoLayouter >> layoutNode: aNode [
	(aNode isKindOf: OPDemoInternalActor) ifTrue: [ self layoutInternalActorExample: aNode ].
	(aNode isKindOf: OPDemoStandardInternalTransaction) ifTrue: [ self layoutStandardInternalTransactionExample: aNode ].
	(aNode isKindOf: OPDemoCompositeActor) ifTrue: [ self layoutCompositeActorExample: aNode ].
	(aNode isKindOf: OPDemoFacts) ifTrue: [ self layoutFactsExample: aNode ].
]

{ #category : 'as yet unclassified' }
OPDemoLayouter >> layoutScopeOfInterest: aScope [
	|scopeController|
	scopeController := diagramController controllerForModel: aScope.
	(aScope elements) do: [ :each | self layoutNode: each].
	scopeController roassalShape position: (Point x:9 y:(-14)).
	scopeController roassalShape width: 806.
	scopeController roassalShape height: 532.
	(scopeController diagramElement labelFirst) position: (Point x:9 y:(-262)).
	aScope elements do: [ :each | ((each isKindOf: OPDemoInternalActor) and: (each name = 'A2')) ifTrue: [ ^ each ] ]
]

{ #category : 'as yet unclassified' }
OPDemoLayouter >> layoutStandardInternalTransactionExample: aNode [
	|nodeController|
	nodeController := diagramController controllerForModel: aNode.
	aNode name = 'T1' ifTrue: [ 
			nodeController roassalShape position: (Point x:(-392) y:(-6)).
			nodeController diagramElement attachedSquare position: (Point x:(-392) y:(-6)).
			(nodeController diagramElement labelFirst) position: (Point x:(-392) y:(-6)).
			].
	aNode name = 'T2' ifTrue: [ 
			nodeController roassalShape position: (Point x:(-392) y:139).
			nodeController diagramElement attachedSquare position: (Point x:(-392) y:139).
			(nodeController diagramElement labelFirst) position: (Point x:(-392) y:139).
			].
	aNode name = 'T3' ifTrue: [ 
			nodeController roassalShape position: (Point x:409 y:(-114)).
			nodeController diagramElement attachedSquare position: (Point x:409 y:(-114)).
			(nodeController diagramElement labelFirst) position: (Point x:409 y:(-114)).
			].
	aNode name = 'T4' ifTrue: [ 
			nodeController roassalShape position: (Point x:409 y:23).
			nodeController diagramElement attachedSquare position: (Point x:409 y:23).
			(nodeController diagramElement labelFirst) position: (Point x:409 y:23).
			].
	aNode name = 'T5' ifTrue: [ 
			nodeController roassalShape position: (Point x:409 y:157).
			nodeController diagramElement attachedSquare position: (Point x:409 y:157).
			(nodeController diagramElement labelFirst) position: (Point x:409 y:157).
			].
	aNode name = 'T6' ifTrue: [ 
			nodeController roassalShape position: (Point x:(-93) y:(-144)).
			nodeController diagramElement attachedSquare position: (Point x:(-93) y:(-144)).
			(nodeController diagramElement labelFirst) position: (Point x:(-93) y:(-144)).
			].
]

{ #category : 'as yet unclassified' }
OPDemoLayouter >> layoutTransactionInsideActorExample: aNode [
	|transactionController|
	self updateCanvas.
	transactionController := diagramController controllerForModel: (aNode elements at: 1).
	transactionController roassalShape position: (Point x:75 y:(-132)).
	self updateCanvas.
	transactionController diagramElement attachedSquare position: (Point x:75 y:(-132)).
	self updateCanvas.
	transactionController diagramElement labelFirst position: (Point x:75 y:(-132)).
	self updateCanvas.
]

{ #category : 'as yet unclassified' }
OPDemoLayouter >> updateActor: actorA2 [
	|actorController|
	actorController := diagramController controllerForModel: actorA2.
	(actorController diagramElement labelFirst) position: (Point x:75 y:(-193)).
	self layoutTransactionInsideActorExample: actorA2 .
]
