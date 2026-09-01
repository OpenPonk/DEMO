"
Base model representing an Actor Role element in a DEMO CSD model. Maintains the actor label, state (internal/composite), and associated transactions.
"
Class {
	#name : 'OPDemoActor',
	#superclass : 'OPDemoElement',
	#instVars : [
		'labelActor'
	],
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'initialization' }
OPDemoActor >> initialize [ 
	super initialize.
	labelActor := 'Actor Role'
]

{ #category : 'testing' }
OPDemoActor >> isComposite [
	^ self subclassResponsibility
]

{ #category : 'testing' }
OPDemoActor >> isInternal [
	^ self subclassResponsibility
]

{ #category : 'testing' }
OPDemoActor >> labelActor [
	^ labelActor
]

{ #category : 'testing' }
OPDemoActor >> labelActor: aString [
	labelActor := aString
]

{ #category : 'testing' }
OPDemoActor >> transactionCount [
	|count|
	count := self elements size.
	^count
]

{ #category : 'testing' }
OPDemoActor >> transactions [
	^ self elements
]
