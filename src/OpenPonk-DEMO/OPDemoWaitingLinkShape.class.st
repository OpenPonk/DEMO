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
