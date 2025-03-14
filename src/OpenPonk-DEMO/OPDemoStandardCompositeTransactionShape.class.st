Class {
	#name : 'OPDemoStandardCompositeTransactionShape',
	#superclass : 'OPDemoElementShape',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPDemoStandardCompositeTransactionShape >> attachedShapes [

	^ super attachedShapes , {
		  label.
		  square}
]

{ #category : 'rendering' }
OPDemoStandardCompositeTransactionShape >> renderBasicShape [

	^ RSCircle new
		  size: 70;
		  color: Color gray;
		  border: (RSBorder new
				   color: Color black;
				   width: 1.5;
				   yourself);
		  yourself
]

{ #category : 'rendering' }
OPDemoStandardCompositeTransactionShape >> renderShapeDetails [

	super renderShapeDetails.

	label := RSLabel new
		         color: Color black;
		         height: 11;
		         model: self;
		         yourself.
	RSLocation new stick: label on: self roassalShape.
	square := RSBox new
		               size: 50;
		               color: Color transparent;
		               model: self;
							borderColor: Color black;
							borderWidth: 1.5;
							rotateByDegrees: 45;
		               yourself.
	RSLocation new stick: square on: self roassalShape.
	self canvas
		add: label;
		add: square
]

{ #category : 'rendering' }
OPDemoStandardCompositeTransactionShape >> selectableInteraction [

	^ OPRSSelectable highlightBorderColorBlue
]

{ #category : 'rendering' }
OPDemoStandardCompositeTransactionShape >> updateRenderFromModel [

	label text: self modelElement name.
	"square borderColor: (self modelElement isFinal
			 ifTrue: [ Color black ]
			 ifFalse: [ Color transparent ])."
	super updateRenderFromModel.
	roassalShape signalUpdate
]
