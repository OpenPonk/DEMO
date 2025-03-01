Class {
	#name : 'OPDemoSourceInitiatorLink',
	#superclass : 'OPDemoLink',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'accessing' }
OPDemoSourceInitiatorLink >> beAccess [
	
	^ OPDemoAccessLink new
]

{ #category : 'accessing' }
OPDemoSourceInitiatorLink >> beTargetInitiator [ 
	
	^ OPDemoTargetInitiatorLink new
]

{ #category : 'accessing' }
OPDemoSourceInitiatorLink >> beWaiting [
	
	^ OPDemoWaitingLink new
]

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
