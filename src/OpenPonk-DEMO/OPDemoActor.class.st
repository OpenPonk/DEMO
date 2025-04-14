Class {
	#name : 'OPDemoActor',
	#superclass : 'OPDemoElement',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'testing' }
OPDemoActor >> isComposite [
	^ self subclassResponsibility
]

{ #category : 'testing' }
OPDemoActor >> isInternal [
	^ self subclassResponsibility
]

{ #category : 'testing' }
OPDemoActor >> nodes [
	^ elements select: [ :each | each isNode ]
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
