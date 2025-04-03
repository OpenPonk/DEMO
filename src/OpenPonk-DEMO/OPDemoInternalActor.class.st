Class {
	#name : 'OPDemoInternalActor',
	#superclass : 'OPDemoActor',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'testing' }
OPDemoInternalActor >> hasTransaction [
	^ (elements not isEmpty)
]

{ #category : 'testing' }
OPDemoInternalActor >> isComposite [
	^ false
]

{ #category : 'testing' }
OPDemoInternalActor >> isInternal [
	^ true
]
