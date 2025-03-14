Class {
	#name : 'OPDemoAccessLink',
	#superclass : 'OPDemoLink',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

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
