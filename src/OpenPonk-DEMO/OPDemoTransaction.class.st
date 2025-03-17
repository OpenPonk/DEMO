Class {
	#name : 'OPDemoTransaction',
	#superclass : 'OPDemoElement',
	#instVars : [
		'isComposite',
		'isMultiple',
		'type'
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

{ #category : 'testing' }
OPDemoTransaction >> type [
	^type
]

{ #category : 'testing' }
OPDemoTransaction >> type: aString [
 	type := aString
]

{ #category : 'testing' }
OPDemoTransaction >> typeColor [
	^type = 'Ontological' ifTrue: [Color red]
		ifFalse: [type = 'Informational' ifTrue: [Color green]
		ifFalse: [type = 'Documental' ifTrue: [Color blue]
		ifFalse: [Color black]]].
]
