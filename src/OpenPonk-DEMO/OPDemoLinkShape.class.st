"
I represent an abstract parent class for Links designes
"
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
	OPDemoLinkLabel in: self
]

{ #category : 'rendering' }
OPDemoLinkShape >> headMarker [

	^ nil
]

{ #category : 'rendering' }
OPDemoLinkShape >> isSourceActor [
	^ self source modelElement isKindOf: OPDemoActor
]

{ #category : 'rendering' }
OPDemoLinkShape >> renderBasicShape [
	| resultShape |
	
	resultShape := 
	 		(self source = self target
		   ifTrue: [ OPRSBezier ]
		   ifFalse: [ OPRSPolyline ]) new
		  attachPoint: (RSBorderAttachPoint new offset: -10);
		  controlPointsController: OPRSDraggableCPController new;
		  addInteraction: OPRSDraggableControlPoints;
		  
		  from: self source roassalShape;
		  to: self target roassalShape;
		  yourself.
		
	self isSourceActor
		ifTrue: [ resultShape markerStart: self headMarker ] 
		ifFalse: [resultShape markerEnd: self headMarker].
		
	resultShape color: Color black.
	
	^ resultShape
]
