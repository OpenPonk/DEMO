"
I represent a model for a multiple composite Transaction
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
