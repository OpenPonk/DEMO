"
I am a class representing an abstract parent of all the nodes

My responsibility is to define the base rules for displaying the elements
"
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
OPDemoElementShape >> labelFirst [
	^ label
]

{ #category : 'rendering' }
OPDemoElementShape >> renderBasicShape [

	^ self subclassResponsibility
]

{ #category : 'rendering' }
OPDemoElementShape >> selectableInteraction [

	^ OPRSSelectable highlightBorderColorBlue
]

{ #category : 'rendering' }
OPDemoElementShape >> shouldBePositionableByUser [

	^ true
]

{ #category : 'rendering' }
OPDemoElementShape >> shouldBeResizableByUser [

	^ false
]
