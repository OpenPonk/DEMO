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
