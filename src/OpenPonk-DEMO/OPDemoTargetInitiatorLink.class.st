"
Model representing a target initiator link in a DEMO CSD diagram.
Connects a transaction to its associated initiating actor role.
"
Class {
	#name : 'OPDemoTargetInitiatorLink',
	#superclass : 'OPDemoLink',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'testing' }
OPDemoTargetInitiatorLink >> isInitiator [ 

	^ true
]

{ #category : 'testing' }
OPDemoTargetInitiatorLink >> isTargetInitiator [ 

	^ true
]
