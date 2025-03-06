Class {
	#name : 'OPDemoTargetInitiatorLink',
	#superclass : 'OPDemoLink',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'accessing' }
OPDemoTargetInitiatorLink >> beAccess [
	
	^ OPDemoAccessLink new
]

{ #category : 'accessing' }
OPDemoTargetInitiatorLink >> beSourceInitiator [ 
	
	^ OPDemoSourceInitiatorLink new
]

{ #category : 'accessing' }
OPDemoTargetInitiatorLink >> beWaiting [
	
	^ OPDemoWaitingLink new
]

{ #category : 'testing' }
OPDemoTargetInitiatorLink >> isAccess [ 

	^ false
]

{ #category : 'testing' }
OPDemoTargetInitiatorLink >> isInitiator [ 

	^ true
]

{ #category : 'testing' }
OPDemoTargetInitiatorLink >> isSourceInitiator [ 

	^ false
]

{ #category : 'testing' }
OPDemoTargetInitiatorLink >> isTargetInitiator [ 

	^ true
]

{ #category : 'testing' }
OPDemoTargetInitiatorLink >> isWaiting [ 

	^ false
]
