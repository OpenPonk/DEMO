"
Model representing a multiple internal transaction in a DEMO CSD diagram.
Denotes a transaction that occurs multiple times and is executed by an internal actor.
"
Class {
	#name : 'OPDemoMultipleInternalTransaction',
	#superclass : 'OPDemoTransaction',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'testing' }
OPDemoMultipleInternalTransaction >> isComposite [
	^ false
]

{ #category : 'testing' }
OPDemoMultipleInternalTransaction >> isMultiple [
	^ true 
]
