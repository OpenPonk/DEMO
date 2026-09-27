"
I am an abstract diagram element representing a DEMO Actor Role.
I manage the underlying Roassal shapes, handling inner shapes, dual labels, and draggable interactions on the diagram.
"
Class {
	#name : 'OPDemoActorShape',
	#superclass : 'OPDemoElementShape',
	#instVars : [
		'label_second'
	],
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'layout' }
OPDemoActorShape >> adaptBoundsToInnerBounds: anInnerRectangle [
	"Resizes actor shape to accommodate its executed transactions if any."
	| requiredExtent |
	requiredExtent := (anInnerRectangle extent + (40 @ 40)) max: 100 @ 100.
	self roassalShape extent: requiredExtent.
	self roassalShape translateTo: anInnerRectangle center.
	self isRendered ifTrue: [ self updateLabels ]
]

{ #category : 'interactions' }
OPDemoActorShape >> addSelectionDraggableInteraction [
	roassalShape @ (OPRSSelectionDraggable thatAlsoDragsShapesProvidedByBlock: [ self innerDraggableRoassalShapes ])
]

{ #category : 'accessing' }
OPDemoActorShape >> attachedShapes [

	^ super attachedShapes , { 
			label .
			label_second }
]

{ #category : 'testing' }
OPDemoActorShape >> isContainer [
	^ true
]

{ #category : 'rendering' }
OPDemoActorShape >> labelIdLocation [
	^ RSLocation new
]

{ #category : 'rendering' }
OPDemoActorShape >> labelSecond [
	^ label_second 
]

{ #category : 'rendering' }
OPDemoActorShape >> labelSecondLocation [
	^ RSLocation new
		bottom;
		center;
		offset: 0 @ -12
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
OPDemoActorShape >> renderShapeDetails [
	super renderShapeDetails.
	label := RSComposite new.
	label_second := RSComposite new.
	self updateLabels.
	self canvas
		add: label;
		add: label_second
]

{ #category : 'interactions' }
OPDemoActorShape >> shouldBeResizableByUser [

	^ true
]

{ #category : 'rendering' }
OPDemoActorShape >> updateLabels [
	self
		updateMultilineLabel: label
		withText: self modelElement name
		fontSize: 17
		bold: true.
	self labelIdLocation stick: label on: self roassalShape.

	self
		updateMultilineLabel: label_second
		withText: self modelElement labelActor
		fontSize: 11
		bold: false.
	self labelSecondLocation stick: label_second on: self roassalShape
]

{ #category : 'rendering' }
OPDemoActorShape >> updateRenderFromModel [
	self updateLabels.
	roassalShape signalUpdate
]
