"
Model representing a composite Actor Role in a DEMO CSD diagram.
Defines an actor role that encapsulates internal transactions and internal logic, allowing structural decomposition.
"
Class {
	#name : 'OPDemoCompositeActor',
	#superclass : 'OPDemoActor',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'testing' }
OPDemoCompositeActor >> isComposite [
	^ true 
]

{ #category : 'testing' }
OPDemoCompositeActor >> isInternal [
	^ false
]
