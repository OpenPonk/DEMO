Class {
	#name : 'OPDemoCompositeActorShape',
	#superclass : 'OPDemoElementShape',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPDemoCompositeActorShape >> attachedShapes [

	^ super attachedShapes , { label }
]

{ #category : 'rendering' }
OPDemoCompositeActorShape >> renderBasicShape [

	^ RSBox new
		  width: 100;
		  height: 100;
		  borderWidth: 2;
		  borderColor: Color black;
		  color: Color gray;
		  yourself
]

{ #category : 'rendering' }
OPDemoCompositeActorShape >> renderShapeDetails [

	super renderShapeDetails.

	label := RSLabel new
		         color: Color black;
		         height: 11;
		         model: self;
		         yourself.
	RSLocation new stick: label on: self roassalShape.
	self canvas
		add: label
]

{ #category : 'rendering' }
OPDemoCompositeActorShape >> selectableInteraction [

	^ OPRSSelectable highlightBorderColorBlue
]

{ #category : 'rendering' }
OPDemoCompositeActorShape >> shouldBeResizableByUser [

	^ true
]

{ #category : 'rendering' }
OPDemoCompositeActorShape >> updateRenderFromModel [

	label text: self modelElement name.
	super updateRenderFromModel.
	roassalShape signalUpdate
]
