"
Model representing a standard internal transaction in a DEMO CSD diagram.
Denotes a singular transaction executed by an internal actor role.
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
