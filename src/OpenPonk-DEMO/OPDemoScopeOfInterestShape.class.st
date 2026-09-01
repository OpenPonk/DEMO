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

{ #category : 'interactions' }
OPDemoScopeOfInterestShape >> addSelectionDraggableInteraction [

	roassalShape
	@ OPRSSelectionDraggableBorder
]

{ #category : 'accessing' }
OPDemoScopeOfInterestShape >> attachedShapes [

	^ super attachedShapes , {
		  label}
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
	|location|
	super renderShapeDetails.
	label := RSLabel new
		         color: Color black;
					fontSize: 17;
					bold;
		         height: 11;
		         model: self;
		         yourself.
		
	location := RSLocation new.
	location top.
	location center.
	location offset: 0@5.
	location stick: label on: self roassalShape.
	self canvas
		add: label
]

{ #category : 'interactions' }
OPDemoScopeOfInterestShape >> shouldBeResizableByUser [

	^ true
]

{ #category : 'rendering' }
OPDemoScopeOfInterestShape >> updateRenderFromModel [

	label text: self modelElement name.
	super updateRenderFromModel.
	roassalShape signalUpdate
]
