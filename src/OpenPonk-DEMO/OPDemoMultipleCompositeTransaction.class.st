"
Model representing a multiple composite transaction in a DEMO CSD diagram.
Denotes a transaction that occurs multiple times and encapsulates an internal process structure.
"
Class {
	#name : 'OPDemoMultipleCompositeTransaction',
	#superclass : 'OPDemoTransaction',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'testing' }
OPDemoMultipleCompositeTransaction >> isComposite [
	^ true 
]

{ #category : 'testing' }
OPDemoMultipleCompositeTransaction >> isMultiple [
	^ true
]
