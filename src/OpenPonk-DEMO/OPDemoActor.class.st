Class {
	#name : 'OPDemoActor',
	#superclass : 'OPDemoElement',
	#instVars : [
		'isComposite',
		'transactionCount'
	],
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'testing' }
OPDemoActor >> isComposite [
	^ self subclassResponsibility
]

{ #category : 'testing' }
OPDemoActor >> isEdge [
	^ false
]

{ #category : 'testing' }
OPDemoActor >> isInternal [
	^ self subclassResponsibility
]

{ #category : 'testing' }
OPDemoActor >> isNode [
	^ true
]

{ #category : 'testing' }
OPDemoActor >> transactionCount [
	^transactionCount 
]
