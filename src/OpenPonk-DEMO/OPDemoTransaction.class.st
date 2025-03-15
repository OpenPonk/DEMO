Class {
	#name : 'OPDemoTransaction',
	#superclass : 'OPDemoElement',
	#instVars : [
		'isComposite',
		'isMultiple'
	],
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'testing' }
OPDemoTransaction >> isComposite [
	^ self subclassResponsibility
]

{ #category : 'testing' }
OPDemoTransaction >> isEdge [
	^ false
]

{ #category : 'testing' }
OPDemoTransaction >> isMultiple [ 
	^ self subclassResponsibility
]

{ #category : 'testing' }
OPDemoTransaction >> isNode [
	^ true
]
