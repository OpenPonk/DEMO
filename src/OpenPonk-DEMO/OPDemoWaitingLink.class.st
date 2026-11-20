"
Model representing a waiting link in a DEMO CSD diagram.
Indicates a dependency where an actor role must wait for the completion of a transaction.
"
Class {
	#name : 'OPDemoWaitingLink',
	#superclass : 'OPDemoLink',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'testing' }
OPDemoWaitingLink >> isWaiting [ 

	^ true
]
