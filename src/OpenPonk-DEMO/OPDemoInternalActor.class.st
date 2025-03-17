Class {
	#name : 'OPDemoInternalActor',
	#superclass : 'OPDemoActor',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'initialization' }
OPDemoInternalActor >> initialize [
	super initialize.
	transactionCount := 0
]

{ #category : 'testing' }
OPDemoInternalActor >> isComposite [
	^ false
]

{ #category : 'testing' }
OPDemoInternalActor >> isEdge [
	^ false
]

{ #category : 'testing' }
OPDemoInternalActor >> isInternal [
	^ true
]

{ #category : 'testing' }
OPDemoInternalActor >> isNode [
	^ true
]
