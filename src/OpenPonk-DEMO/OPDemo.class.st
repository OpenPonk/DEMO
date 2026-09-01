"
Represents the root model object of a DEMO CSD diagram. Acts as the container for all elements (nodes, edges, actors, transactions) within the model.
"
Class {
	#name : 'OPDemo',
	#superclass : 'OPModelObject',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'accessing' }
OPDemo >> allEdges [
	"^ self edges asSet , self nodes flatCollect: [ :each | each outgoing ]"
	^ (self edges asSet , (self nodes flatCollect: [ :each | each allEdges ])) asArray
	
]

{ #category : 'accessing' }
OPDemo >> edges [
	^ elements select: [ :each | each isEdge ]
]

{ #category : 'accessing' }
OPDemo >> getCompositeActors [
	^ elements select: [ :each | each isKindOf: OPDemoCompositeActor ]

]

{ #category : 'accessing' }
OPDemo >> getFacts [
	^ elements select: [ :each | each isKindOf: OPDemoFacts ]

]

{ #category : 'accessing' }
OPDemo >> getScopeOfInterest [
	^ elements select: [ :each | each isKindOf: OPDemoScopeOfInterest ]

]

{ #category : 'testing' }
OPDemo >> isEdge [
	^ false
]

{ #category : 'testing' }
OPDemo >> isNode [
	^ false
]

{ #category : 'accessing' }
OPDemo >> nodes [
	^ elements select: [ :each | each isNode ]

]

{ #category : 'accessing' }
OPDemo >> rootOwner [
	^ self
]
