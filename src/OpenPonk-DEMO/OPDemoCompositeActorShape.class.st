"
I am a diagram element representing a DEMO composite Actor Role.
I manage the rendering details and updates of its underlying Roassal shape, accommodating internal transactions.
"
Class {
	#name : 'OPDemoCompositeActorShape',
	#superclass : 'OPDemoActorShape',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPDemoCompositeActorShape >> renderBasicShape [

	^ super renderBasicShape color: Color gray;
	yourself
]
