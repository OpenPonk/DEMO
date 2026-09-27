"
Applies automated layout algorithms to DEMO CSD diagrams. Positions transactions inside actors and aligns related nodes and edges to maintain visual semantics.
"
Class {
	#name : 'OPDemoLayouter',
	#superclass : 'OPHierarchicalNodesAndEdgesLayouter',
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

{ #category : 'userinterface' }
OPDemoLayouter >> applyLayout: aTwoArgBlock [
	"Lays out DEMO diagram hierarchically: inner containers bottom up, then top level shapes."
	| allTargetNodes snapshot activeContainers topLevelBoxes commands |
	allTargetNodes := self allRenderedNodeShapes.
	snapshot := OPDiagramGeometrySnapshot onNodes: allTargetNodes.

	activeContainers := self containerElementsBottomUp.
	self layoutContainersHierarchically: activeContainers.

	topLevelBoxes := self topLevelNodeShapes.

	aTwoArgBlock
		value: topLevelBoxes
		value: (self innerEdgesFor: topLevelBoxes).

	self unsubscribeContainers: activeContainers.

	commands := snapshot deltaCommands.
	self executeLayoutCommands: commands.
	self updateCanvas
]

{ #category : 'layouts' }
OPDemoLayouter >> defaultLayout [
	self isCarRentalExample ifTrue: [
		^ (OPDemoCarRentalLayouter new diagramController: diagramController) defaultLayout ].

	self applyLayout: [ :topBoxes :topEdges |
		RSGridLayout new
			gapSize: 80;
			on: topBoxes ]
]

{ #category : 'testing' }
OPDemoLayouter >> isCarRentalExample [
	"Answers whether the current model represents the Car Rental example."
	^ diagramController model name = 'Car Rental Example'
]

{ #category : 'layouts' }
OPDemoLayouter >> layoutInnerContentOf: aContainerElement shapes: directShapes edges: directEdges [
	"Lays out direct children inside a DEMO container using grid."
	directShapes ifNotEmpty: [
		RSGridLayout new
			gapSize: 30;
			on: directShapes ]
]

{ #category : 'processing' }
OPDemoLayouter >> layoutScopeOfInterest: aScope [
	"Delegates scope of interest layout to the car rental layouter."
	^ (OPDemoCarRentalLayouter new diagramController: diagramController) layoutScopeOfInterest: aScope
]
