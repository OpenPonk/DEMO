Class {
	#name : 'OPDemoWaitingLink',
	#superclass : 'OPDemoLink',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'accessing' }
OPDemoWaitingLink >> beAccess [
	
	^ OPDemoAccessLink new
]

{ #category : 'accessing' }
OPDemoWaitingLink >> beSourceInitiator [ 
	
	^ OPDemoSourceInitiatorLink new
]

{ #category : 'accessing' }
OPDemoWaitingLink >> beTargetInitiator [ 
	
	^ OPDemoTargetInitiatorLink new
]

{ #category : 'testing' }
OPDemoWaitingLink >> isAccess [

	^ false
]

{ #category : 'testing' }
OPDemoWaitingLink >> isInitiator [

	^ false
]

{ #category : 'testing' }
OPDemoWaitingLink >> isSourceInitiator [

	^ false
]

{ #category : 'testing' }
OPDemoWaitingLink >> isTargetInitiator [

	^ false
]

{ #category : 'testing' }
OPDemoWaitingLink >> isWaiting [ 

	^ true
]
