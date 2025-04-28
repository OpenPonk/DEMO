"
I represent a model for a multiple internal Transaction
"
Class {
	#name : 'OPDemoMultipleInternalTransaction',
	#superclass : 'OPDemoTransaction',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'testing' }
OPDemoMultipleInternalTransaction >> isComposite [
	^ false
]

{ #category : 'testing' }
OPDemoMultipleInternalTransaction >> isMultiple [
	^ true 
]
