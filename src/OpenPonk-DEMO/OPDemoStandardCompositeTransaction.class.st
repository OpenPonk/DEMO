"
Model representing a standard composite transaction in a DEMO CSD diagram.
Denotes a singular transaction that encapsulates an internal process structure.
"
Class {
	#name : 'OPDemoStandardCompositeTransaction',
	#superclass : 'OPDemoTransaction',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'testing' }
OPDemoStandardCompositeTransaction >> isComposite [
	^ true 
]

{ #category : 'testing' }
OPDemoStandardCompositeTransaction >> isMultiple [ 
	^ false
]
