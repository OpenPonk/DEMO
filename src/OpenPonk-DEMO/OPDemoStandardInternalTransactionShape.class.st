Class {
	#name : 'OPDemoStandardInternalTransactionShape',
	#superclass : 'OPDemoElementShape',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPDemoStandardInternalTransactionShape >> attachedShapes [

	^ super attachedShapes , {
		  label.
		  square}
]

{ #category : 'rendering' }
OPDemoStandardInternalTransactionShape >> renderBasicShape [

	^ RSCircle new
		  size: 70;
		  color: Color white;
		  border: (RSBorder new
				   color: Color black;
				   width: 1.5;
				   yourself);
		  yourself
]

{ #category : 'rendering' }
OPDemoStandardInternalTransactionShape >> renderShapeDetails [

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
						   borderColor: Color red;
							borderWidth: 1.5;
							rotateByDegrees: 45;
		               yourself.
	RSLocation new stick: square on: self roassalShape.
	self canvas
		add: label;
		add: square
]

{ #category : 'rendering' }
OPDemoStandardInternalTransactionShape >> selectableInteraction [

	^ OPRSSelectable highlightBorderColorBlue
]

{ #category : 'rendering' }
OPDemoStandardInternalTransactionShape >> shouldBeResizableByUser [

	^ true
]

{ #category : 'rendering' }
OPDemoStandardInternalTransactionShape >> updateRenderFromModel [

	label text: self modelElement name.
	"square borderColor: (self modelElement isFinal
			 ifTrue: [ Color black ]
			 ifFalse: [ Color transparent ])."
	super updateRenderFromModel.
	roassalShape signalUpdate
]
