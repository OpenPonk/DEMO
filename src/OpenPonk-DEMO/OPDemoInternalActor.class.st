Class {
	#name : 'OPDemoInternalActor',
	#superclass : 'OPDemoActor',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

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
