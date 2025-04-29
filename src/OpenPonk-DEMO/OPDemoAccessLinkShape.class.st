"
My responsibility is to display an Access Link
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
