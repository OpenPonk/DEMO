"
I am a diagram element (edge) representing a DEMO waiting link.
I manage the edge styling and specific head markers to visually denote a waiting dependency in its underlying Roassal shape.
"
Class {
	#name : 'OPDemoWaitingLinkShape',
	#superclass : 'OPDemoLinkShape',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPDemoWaitingLinkShape >> headMarker [

	^ OPRSMarkerBuilder arrow 
]

{ #category : 'rendering' }
OPDemoWaitingLinkShape >> renderBasicShape [

	^ super renderBasicShape dashed;
	yourself
]
