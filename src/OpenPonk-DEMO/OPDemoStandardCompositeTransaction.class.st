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
