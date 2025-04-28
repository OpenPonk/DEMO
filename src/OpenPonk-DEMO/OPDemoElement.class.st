"
I am an abstract parent class for all the nodes elements in a diagram
"
Class {
	#name : 'OPDemoElement',
	#superclass : 'OPModelObject',
	#instVars : [
		'element_id'
	],
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'accessing' }
OPDemoElement >> allEdges [
	^ (elements select: [ :each | each isEdge ]) asSet , (self nodes flatCollect: [ :each | each allEdges ]) asArray
	"^ elements flatCollect: [ :each | each allEdges ]"
]

{ #category : 'accessing' }
OPDemoElement >> edges [
	^ (self incoming , self outgoing)
]

{ #category : 'accessing' }
OPDemoElement >> incoming [
	|root|
	root := self rootOwner.
	^ root allEdges select: [ :each | each target = self ]
]

{ #category : 'accessing' }
OPDemoElement >> isEdge [
	^ false
]

{ #category : 'accessing' }
OPDemoElement >> isNode [
	^ true
]

{ #category : 'accessing' }
OPDemoElement >> nodes [
	^ elements select: [ :each | each isNode ]
]

{ #category : 'accessing' }
OPDemoElement >> outgoing [
	|root|
	root := self rootOwner.
	^ root allEdges select: [ :each | each source = self ]
]

{ #category : 'accessing' }
OPDemoElement >> rootOwner [
    ^ self owner
          ifNil: [ ^ self ]
          ifNotNil: [ :existingOwner | existingOwner rootOwner ]
]
