Class {
	#name : 'OPDemoAccessLink',
	#superclass : 'OPDemoLink',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'accessing' }
OPDemoAccessLink >> beSourceInitiator [
	
	^ OPDemoSourceInitiatorLink new
]

{ #category : 'accessing' }
OPDemoAccessLink >> beTargetInitiator [
	
	^ OPDemoTargetInitiatorLink new
]

{ #category : 'accessing' }
OPDemoAccessLink >> beWaiting [
	
	^ OPDemoWaitingLink new
]

{ #category : 'testing' }
OPDemoAccessLink >> isAccess [ 
	
	^ true
]

{ #category : 'testing' }
OPDemoAccessLink >> isInitiator [
	
	^ false
]

{ #category : 'testing' }
OPDemoAccessLink >> isSourceInitiator [
	
	^ false
]

{ #category : 'testing' }
OPDemoAccessLink >> isTargetInitiator [
	
	^ false
]

{ #category : 'testing' }
OPDemoAccessLink >> isWaiting [
	
	^ false
]
