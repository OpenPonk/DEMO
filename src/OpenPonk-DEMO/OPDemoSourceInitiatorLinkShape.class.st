"
I am a diagram element (edge) representing a DEMO source initiator link.
I define the specific edge styling and head markers for creating its underlying Roassal shape.
"
Class {
	#name : 'OPDemoSourceInitiatorLinkShape',
	#superclass : 'OPDemoLinkShape',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPDemoSourceInitiatorLinkShape >> headMarker [

	^ OPRSMarkerBuilder diamond
]
