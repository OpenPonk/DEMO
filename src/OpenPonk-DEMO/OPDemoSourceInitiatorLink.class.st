"
Model representing a source initiator link (often conceptually acting as an executor link) in a DEMO CSD diagram.
Connects an actor role to a transaction it executes or initiates.
"
Class {
	#name : 'OPDemoSourceInitiatorLink',
	#superclass : 'OPDemoLink',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'testing' }
OPDemoSourceInitiatorLink >> isAccess [ 

	^ false
]

{ #category : 'testing' }
OPDemoSourceInitiatorLink >> isInitiator [ 

	^ true
]

{ #category : 'testing' }
OPDemoSourceInitiatorLink >> isSourceInitiator [ 

	^ true
]

{ #category : 'testing' }
OPDemoSourceInitiatorLink >> isTargetInitiator [ 

	^ false
]

{ #category : 'testing' }
OPDemoSourceInitiatorLink >> isWaiting [

	^ false
]
