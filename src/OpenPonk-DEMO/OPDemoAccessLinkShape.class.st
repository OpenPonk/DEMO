"
I am a diagram element (edge) representing a DEMO Access Link.
I define the rendering and styling rules for creating the underlying Roassal shape for access edges in the diagram.
"
Class {
	#name : 'OPDemoAccessLinkShape',
	#superclass : 'OPDemoLinkShape',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPDemoAccessLinkShape >> renderBasicShape [

	^ super renderBasicShape dashed;
	yourself
]
