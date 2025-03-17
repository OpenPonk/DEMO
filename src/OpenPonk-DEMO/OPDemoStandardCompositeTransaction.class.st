Class {
	#name : 'OPDemoStandardCompositeTransaction',
	#superclass : 'OPDemoTransaction',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'initialization' }
OPDemoStandardCompositeTransaction >> initialize [ 
	super initialize.
	type := 'Ontological'
]

{ #category : 'testing' }
OPDemoStandardCompositeTransaction >> isComposite [
	^ true 
]

{ #category : 'testing' }
OPDemoStandardCompositeTransaction >> isMultiple [ 
	^ false
]
