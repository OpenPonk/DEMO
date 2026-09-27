"
I am a diagram element representing a DEMO Scope of Interest.
I handle the rendering rules and selection-based draggable interactions for its underlying Roassal shape (the scope boundary frame).
"
Class {
	#name : 'OPDemoScopeOfInterestShape',
	#superclass : 'OPDemoElementShape',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'layout' }
OPDemoScopeOfInterestShape >> adaptBoundsToInnerBounds: anInnerRectangle [
	"Adapts scope bounding box to safely enclose inner actors and transactions."
	| newBounds |
	newBounds := anInnerRectangle expandBy: 40 @ 40.
	self roassalShape
		extent: newBounds extent;
		translateTo: newBounds center.
	self isRendered ifTrue: [ self updateLabel ]
]

{ #category : 'interactions' }
OPDemoScopeOfInterestShape >> addSelectionDraggableInteraction [
	roassalShape @ (OPRSSelectionDraggableBorder thatAlsoDragsShapesProvidedByBlock: [ self innerDraggableRoassalShapes ])
]

{ #category : 'accessing' }
OPDemoScopeOfInterestShape >> attachedShapes [

	^ super attachedShapes , {
		  label}
]

{ #category : 'testing' }
OPDemoScopeOfInterestShape >> isContainer [
	^ true
]

{ #category : 'rendering' }
OPDemoScopeOfInterestShape >> renderBasicShape [

	^ RSBox new
		  width: 800;
		  height: 600;
		  borderWidth: 6;
		  borderColor: Color gray;
		  color: Color transparent;
		  yourself

]

{ #category : 'rendering' }
OPDemoScopeOfInterestShape >> renderShapeDetails [
	super renderShapeDetails.
	label := RSComposite new.
	self updateLabel.
	self canvas add: label
]

{ #category : 'interactions' }
OPDemoScopeOfInterestShape >> shouldBeResizableByUser [

	^ true
]

{ #category : 'rendering' }
OPDemoScopeOfInterestShape >> updateLabel [
	self
		updateMultilineLabel: label
		withText: self modelElement name
		fontSize: 17
		bold: true.
	RSLocation new
		top;
		center;
		offset: 0 @ 15;
		stick: label on: self roassalShape
]

{ #category : 'rendering' }
OPDemoScopeOfInterestShape >> updateRenderFromModel [
	self updateLabel.
	roassalShape signalUpdate
]
