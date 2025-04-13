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
OPDemoWaitingLinkShape >> isSourceActor [
	^ self source modelElement isKindOf: OPDemoActor
]

{ #category : 'rendering' }
OPDemoWaitingLinkShape >> renderBasicShape [
	| resultShape |
	
	resultShape := 
	 		(self source = self target
		   ifTrue: [ OPRSBezier ]
		   ifFalse: [ OPRSPolyline ]) new
		  dashed;
		  attachPoint: (RSBorderAttachPoint new offset: -10);
		  controlPointsController: OPRSDraggableCPController new;
		  addInteraction: OPRSDraggableControlPoints;
		  color: Color black;
		  from: self source roassalShape;
		  to: self target roassalShape;
		  yourself.
		
	self isSourceActor
		ifTrue: [ resultShape markerStart: self headMarker ] 
		ifFalse: [resultShape markerEnd: self headMarker].
	
	^ resultShape
]
