Class {
	#name : 'OPDemoElementShape',
	#superclass : 'OPBoundNode',
	#instVars : [
		'label',
		'square'
	],
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPDemoElementShape >> renderBasicShape [

	^ self subclassResponsibility
]

{ #category : 'rendering' }
OPDemoElementShape >> shouldBePositionableByUser [

	^ true
]

{ #category : 'rendering' }
OPDemoElementShape >> shouldBeResizableByUser [

	^ true
]
