"
I represent a model for a standard internal Transaction
"
Class {
	#name : 'OPDemoStandardInternalTransaction',
	#superclass : 'OPDemoTransaction',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'testing' }
OPDemoStandardInternalTransaction >> isComposite [
	^ false
]

{ #category : 'testing' }
OPDemoStandardInternalTransaction >> isMultiple [
	^ false
]
