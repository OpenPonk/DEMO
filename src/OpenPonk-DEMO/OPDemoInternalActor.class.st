"
Model representing an internal Actor Role in a DEMO CSD diagram.
Defines an elementary actor role that executes internal transactions without internal decomposition.
"
Class {
	#name : 'OPDemoInternalActor',
	#superclass : 'OPDemoActor',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'testing' }
OPDemoInternalActor >> hasTransaction [

	^ elements isNotEmpty
]

{ #category : 'testing' }
OPDemoInternalActor >> isComposite [
	^ false
]

{ #category : 'testing' }
OPDemoInternalActor >> isInternal [
	^ true
]
