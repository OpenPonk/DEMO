"
I represent a model for an Executor Link
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
