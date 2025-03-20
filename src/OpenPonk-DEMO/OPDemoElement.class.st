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
OPDemoElement >> edges [
	^ (self incoming + self outgoing)
]

{ #category : 'accessing' }
OPDemoElement >> incoming [
	owner ifNil: [ ^ #() ].
	^ owner edges select: [ :each | each target = self ]
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
OPDemoElement >> outgoing [
	owner ifNil: [ ^ #() ].
	^ owner edges select: [ :each | each source = self ]
]
