"
I am an abstract parent class representing a model of a Transaction
"
Class {
	#name : 'OPDemoTransaction',
	#superclass : 'OPDemoElement',
	#instVars : [
		'type',
		'product_kind'
	],
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'initialization' }
OPDemoTransaction >> initialize [ 
	super initialize.
	type := 'Ontological'.
	product_kind := 'Product Kind'
]

{ #category : 'testing' }
OPDemoTransaction >> isComposite [
	^ self subclassResponsibility
]

{ #category : 'testing' }
OPDemoTransaction >> isMultiple [ 
	^ self subclassResponsibility
]

{ #category : 'testing' }
OPDemoTransaction >> productKind [
	^ product_kind 
]

{ #category : 'testing' }
OPDemoTransaction >> productKind: aString [
 	product_kind := aString
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
		ifFalse: [type = 'Material' ifTrue: [Color black]]]].
]
