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

{ #category : 'layouts' }
OPDemoLayouter >> layoutDiagramExample: aDiagram [
	|scope|
	scope := (aDiagram getScopeOfInterest at: 1).
	self layoutScopeOfInterest: scope.
	self updateCanvas.



"| shownParticipants |
	shownParticipants := aDiagram participants select: [ :each | 
		                     diagramController hasControllerForModel: each ].
	shownParticipants do: [ :each | self layoutParticipant: each ].
	self layoutParticipants: shownParticipants.
	self updateCanvas.
	self layoutCommunications:
		(self collectCommunications: shownParticipants).
	self updateCanvas"
]

{ #category : 'as yet unclassified' }
OPDemoLayouter >> layoutNode: aNode [
	|nodeController|
	nodeController := diagramController controllerForModel: aNode.
	aNode name = 'A1' ifTrue: [ 
			nodeController roassalShape position: (Point x:(-246) y:67).
			nodeController roassalShape width: 102.
			nodeController roassalShape height: 247.
			(nodeController diagramElement labelFirst) position: (Point x:(-246) y:67).
			(nodeController diagramElement labelSecond) position: (Point x:(-246) y:182).
			].
	aNode name = 'A6' ifTrue: [ 
			nodeController roassalShape position: (Point x:(-246) y:(-144)).
			(nodeController diagramElement labelFirst) position: (Point x:(-246) y:(-144)).
			(nodeController diagramElement labelSecond) position: (Point x:(-246) y:(-102)).
			].
]

{ #category : 'as yet unclassified' }
OPDemoLayouter >> layoutScopeOfInterest: aScope [
	|scopeController|
	scopeController := diagramController controllerForModel: aScope.
	(aScope elements) do: [ :each | self layoutNode: each].
	scopeController roassalShape position: (Point x:0 y:0).
	scopeController roassalShape width: 806.
	scopeController roassalShape height: 532.
	(scopeController diagramElement labelFirst) position: (Point x:9 y:(-14)).
]

{ #category : 'as yet unclassified' }
OPDemoLayouter >> layoutScopesOfInterest: scopes [
]
