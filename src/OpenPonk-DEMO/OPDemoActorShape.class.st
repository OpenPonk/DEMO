"
I am an abstract diagram element representing a DEMO Actor Role.
I manage the underlying Roassal shapes, handling inner shapes, dual labels, and draggable interactions on the diagram.
"
Class {
	#name : 'OPDemoActorShape',
	#superclass : 'OPDemoElementShape',
	#instVars : [
		'innerRoassalShapesBlock',
		'label_second'
	],
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'interactions' }
OPDemoActorShape >> addSelectionDraggableInteraction [

	roassalShape
	@ (OPRSSelectionDraggable thatAlsoDragsShapesProvidedByBlock:
			 innerRoassalShapesBlock)
]

{ #category : 'accessing' }
OPDemoActorShape >> attachedShapes [

	^ super attachedShapes , { 
			label .
			label_second }
]

{ #category : 'rendering' }
OPDemoActorShape >> innerRoassalShapesBlock: aBlock [

	innerRoassalShapesBlock := aBlock
]

{ #category : 'rendering' }
OPDemoActorShape >> labelSecond [
	^ label_second 
]

{ #category : 'rendering' }
OPDemoActorShape >> renderBasicShape [

	^ RSBox new
		  width: 100;
		  height: 100;
		  borderWidth: 2;
		  borderColor: Color black;
		  color: Color white;
		  yourself
]

{ #category : 'interactions' }
OPDemoActorShape >> shouldBeResizableByUser [

	^ true
]
