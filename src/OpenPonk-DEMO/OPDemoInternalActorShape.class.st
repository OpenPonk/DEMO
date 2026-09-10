"
I am a diagram element representing a DEMO internal Actor Role.
I manage the rendering details, labels, and updates of its underlying Roassal shape.
"
Class {
	#name : 'OPDemoInternalActorShape',
	#superclass : 'OPDemoActorShape',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPDemoInternalActorShape >> labelCenterPosition [
	^ RSLocation new
	
]

{ #category : 'rendering' }
OPDemoInternalActorShape >> labelIdLocation [
	self modelElement transactionCount = 1 ifTrue: [
		^ RSLocation new
			top;
			center;
			offset: 0 @ 12 ].
	^ RSLocation new
]

{ #category : 'rendering' }
OPDemoInternalActorShape >> labelTopPosition [
	|returnLocation|
	returnLocation := RSLocation new.
	returnLocation top.
	returnLocation center.
	returnLocation offset: 0@5.
	^ returnLocation 
	
]
