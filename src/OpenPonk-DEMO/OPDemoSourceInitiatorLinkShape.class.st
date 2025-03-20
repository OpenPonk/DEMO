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

{ #category : 'rendering' }
OPDemoSourceInitiatorLinkShape >> isSourceActor [
	^ self source modelElement isKindOf: OPDemoActor
]

{ #category : 'rendering' }
OPDemoSourceInitiatorLinkShape >> renderBasicShape [
	| resultShape |

	resultShape := 
		  (self source = self target
		   ifTrue: [ OPRSBezier ]
		   ifFalse: [ OPRSPolyline ]) new
		  "markerEnd: self headMarker;"
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
