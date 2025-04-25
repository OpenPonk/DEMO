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

{ #category : 'rendering' }
OPDemoActorShape >> addSelectionDraggableInteraction [

	roassalShape
	@ (OPRSSelectionDraggable thatAlsoDragsShapesProvidedByBlock:
			 innerRoassalShapesBlock)
]

{ #category : 'rendering' }
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
OPDemoActorShape >> renderBasicShape [

	^ RSBox new
		  width: 100;
		  height: 100;
		  borderWidth: 2;
		  borderColor: Color black;
		  color: Color white;
		  yourself
]

{ #category : 'rendering' }
OPDemoActorShape >> shouldBeResizableByUser [

	^ true
]
