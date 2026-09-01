"
I am an abstract diagram element (node) representing a DEMO element.
I define the base rules for displaying elements, creating the underlying Roassal shape, labels, and bounding boxes.
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

{ #category : 'interactions' }
OPDemoElementShape >> selectableInteraction [

	^ OPRSSelectable highlightBorderColorBlue
]
