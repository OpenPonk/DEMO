Class {
	#name : 'OPDemoStandardInternalTransaction',
	#superclass : 'OPDemoTransaction',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'initialization' }
OPDemoStandardInternalTransaction >> initialize [ 
	super initialize.
	type := 'Ontological'
]

{ #category : 'testing' }
OPDemoStandardInternalTransaction >> isComposite [
	^ false
]

{ #category : 'testing' }
OPDemoStandardInternalTransaction >> isMultiple [
	^ false
]
