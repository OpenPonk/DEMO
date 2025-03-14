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
			or: [(ctrl isKindOf: OPDemoMultipleInternalTransactionController )]]]]]]]
		thenCollect: #roassalShape
]

{ #category : 'layouts' }
OPDemoLayouter >> defaultLayout [
	self gridLayout
]
