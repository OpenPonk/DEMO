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
