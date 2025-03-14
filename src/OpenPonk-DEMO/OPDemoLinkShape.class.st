Class {
	#name : 'OPDemoLinkShape',
	#superclass : 'OPEdge',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPDemoLinkShape >> createOwnedElementsWithoutController [

	self ownedElements ifNotEmpty: [ ^ self ].
	OPFsmTransitionLabel in: self
]

{ #category : 'rendering' }
OPDemoLinkShape >> headMarker [

	^ self subclassResponsibility
]

{ #category : 'rendering' }
OPDemoLinkShape >> renderBasicShape [

	^ self subclassResponsibility
]
