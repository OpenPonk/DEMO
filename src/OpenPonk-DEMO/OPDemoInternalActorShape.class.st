Class {
	#name : 'OPDemoInternalActorShape',
	#superclass : 'OPDemoElementShape',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPDemoInternalActorShape >> attachedShapes [

	^ super attachedShapes , {
		  label}
]

{ #category : 'rendering' }
OPDemoInternalActorShape >> renderBasicShape [

	^ RSBox new
		  width: 100;
		  height: 100;
		  borderWidth: 2;
		  borderColor: Color black;
		  color: Color white;
		  yourself
]

{ #category : 'rendering' }
OPDemoInternalActorShape >> renderShapeDetails [
	super renderShapeDetails.

	label := RSLabel new
		         color: Color black;
		         height: 11;
		         model: self;
		         yourself.
	RSLocation new stick: label on: self roassalShape.
	self canvas add: label
]

{ #category : 'rendering' }
OPDemoInternalActorShape >> selectableInteraction [

	^ OPRSSelectable highlightBorderColorBlue
]

{ #category : 'rendering' }
OPDemoInternalActorShape >> shouldBeResizableByUser [

	^ true
]

{ #category : 'rendering' }
OPDemoInternalActorShape >> updateRenderFromModel [

	label text: self modelElement name.
	super updateRenderFromModel.
	roassalShape signalUpdate
]
