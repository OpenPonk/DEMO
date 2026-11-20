"
Model representing an access link in a DEMO CSD diagram. Denotes a connection where an actor role has access to an information bank or transaction result.
"
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
