"
I basically represent a class containing all the elements present in a diagram

I provide an environment for accessing all the elements
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
