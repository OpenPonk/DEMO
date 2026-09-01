"
Applies automated layout algorithms to DEMO CSD diagrams. Positions transactions inside actors and aligns related nodes and edges to maintain visual semantics.
"
Class {
	#name : 'OPDemoLayouter',
	#superclass : 'OPNodesAndEdgesLayouter',
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

	diagramController model name = 'Car Rental Example'
		ifTrue: [ self layoutDiagramExample: diagramController model ]
		ifFalse: [ self gridLayout ]
]

{ #category : 'processing' }
OPDemoLayouter >> layoutCompositeActorExample: aNode [

	| actions |
	actions := {
		           ('CA1' -> [ :ctrl :elem |
			            ctrl roassalShape position: -546 @ -6.
			            elem labelFirst position: -546 @ -6.
			            elem labelSecond position: -546 @ 36 ]).
		           ('CA2' -> [ :ctrl :elem |
			            ctrl roassalShape
				            position: 569 @ -43;
				            height: 243.
			            elem labelFirst position: 569 @ -43.
			            elem labelSecond position: 569 @ 70 ]).
		           ('CA3' -> [ :ctrl :elem |
			            ctrl roassalShape position: 569 @ 157.
			            elem labelFirst position: 569 @ 157.
			            elem labelSecond position: 569 @ 199 ]).
		           ('CA4' -> [ :ctrl :elem |
			            ctrl roassalShape position: -546 @ 139.
			            elem labelFirst position: -546 @ 139.
			            elem labelSecond position: -546 @ 181 ]) } asDictionary.

	actions at: aNode name ifPresent: [ :action |
			| nodeController |
			nodeController := diagramController controllerForModel: aNode.
			action value: nodeController value: nodeController diagramElement ]
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

{ #category : 'processing' }
OPDemoLayouter >> layoutFactsExample: aNode [

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
OPDemoLayouter >> layoutInternalActorExample: aNode [
    | actions |
    actions := {
        'A1' -> [ :ctrl :elem |
            ctrl roassalShape position: -246 @ 67; height: 247.
            elem labelFirst position: -246 @ 67.
            elem labelSecond position: -246 @ 182 ].
        'A6' -> [ :ctrl :elem |
            ctrl roassalShape position: -246 @ -144.
            elem labelFirst position: -246 @ -144.
            elem labelSecond position: -246 @ -102 ].
        'A3' -> [ :ctrl :elem |
            ctrl roassalShape position: 254 @ 23; height: 373.
            elem labelFirst position: 254 @ 23.
            elem labelSecond position: 254 @ 202 ].
        'A2' -> [ :ctrl :elem |
            ctrl roassalShape position: 75 @ -144; width: 150; height: 137.
            elem labelFirst position: 75 @ -193.
            elem labelSecond position: 75 @ -84.
            self layoutTransactionInsideActorExample: aNode ]
    } asDictionary.

    actions at: aNode name ifPresent: [ :action | 
        | nodeController |
        nodeController := diagramController controllerForModel: aNode.
        action value: nodeController value: nodeController diagramElement ]
]

{ #category : 'processing' }
OPDemoLayouter >> layoutNode: aNode [
	(aNode isKindOf: OPDemoInternalActor) ifTrue: [ self layoutInternalActorExample: aNode ].
	(aNode isKindOf: OPDemoStandardInternalTransaction) ifTrue: [ self layoutStandardInternalTransactionExample: aNode ].
	(aNode isKindOf: OPDemoCompositeActor) ifTrue: [ self layoutCompositeActorExample: aNode ].
	(aNode isKindOf: OPDemoFacts) ifTrue: [ self layoutFactsExample: aNode ].
]

{ #category : 'processing' }
OPDemoLayouter >> layoutScopeOfInterest: aScope [

	| scopeController |
	scopeController := diagramController controllerForModel: aScope.
	aScope elements do: [ :each | self layoutNode: each ].

	scopeController roassalShape
		position: 9 @ -14;
		width: 806;
		height: 532.
	scopeController diagramElement labelFirst position: 9 @ -262.

	aScope elements detect: [ :any |
		(any isKindOf: OPDemoInternalActor) and: [ any name = 'A2' ] ]
]

{ #category : 'processing' }
OPDemoLayouter >> layoutStandardInternalTransactionExample: aNode [

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
OPDemoLayouter >> layoutTransactionInsideActorExample: aNode [

	| transactionController |
	self updateCanvas.
	transactionController := diagramController controllerForModel:
		                         aNode elements first.
	transactionController roassalShape position: 75 @ -132.
	self updateCanvas.
	transactionController diagramElement attachedSquare position:
		75 @ -132.
	self updateCanvas.
	transactionController diagramElement labelFirst position: 75 @ -132.
	self updateCanvas
]

{ #category : 'processing' }
OPDemoLayouter >> updateActor: actorA2 [

	| actorController |
	actorController := diagramController controllerForModel: actorA2.
	actorController diagramElement labelFirst position: 75 @ -193.
	self layoutTransactionInsideActorExample: actorA2
]
