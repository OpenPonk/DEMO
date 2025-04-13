Class {
	#name : 'OPDemoInternalActorShape',
	#superclass : 'OPDemoElementShape',
	#instVars : [
		'innerRoassalShapesBlock'
	],
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPDemoInternalActorShape >> addSelectionDraggableInteraction [

	roassalShape
	@ (OPRSSelectionDraggable thatAlsoDragsShapesProvidedByBlock:
			 innerRoassalShapesBlock)
]

{ #category : 'rendering' }
OPDemoInternalActorShape >> attachedShapes [

	^ super attachedShapes , {
		  label}
]

{ #category : 'rendering' }
OPDemoInternalActorShape >> innerRoassalShapesBlock: aBlock [

	innerRoassalShapesBlock := aBlock
]

{ #category : 'rendering' }
OPDemoInternalActorShape >> labelCenterPosition [
	^ RSLocation new
	
]

{ #category : 'rendering' }
OPDemoInternalActorShape >> labelTopPosition [
	|returnLocation|
	returnLocation := RSLocation new.
	returnLocation top.
	returnLocation center.
	returnLocation offset: 0@5.
	^ returnLocation 
	
]

{ #category : 'rendering' }
OPDemoInternalActorShape >> renderBasicShape [
UIManager default inform: 'renderBasicShape'.

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
UIManager default inform: 'renderShapeDetails'.
	super renderShapeDetails.
	
	label := RSLabel new
		         color: Color black;
		         height: 11;
		         model: self;
		         yourself.
	label text: self modelElement name.
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
	|location|
	UIManager default inform: 'updateRenderFromModel'.
	location := RSLocation new.
	label text: self modelElement name.
	self modelElement transactionCount=1 ifTrue: [ location := self labelTopPosition ].
	self modelElement transactionCount=0 ifTrue: [ location := self labelCenterPosition ].
	location stick: label on: self roassalShape .
	super updateRenderFromModel.
	roassalShape signalUpdate
]
