"
I am in charge of displaying a standard composite Transaction
"
Class {
	#name : 'OPDemoStandardCompositeTransactionShape',
	#superclass : 'OPDemoTransactionShape',
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

	^ super renderBasicShape color: Color gray;
	yourself
]

{ #category : 'rendering' }
OPDemoStandardCompositeTransactionShape >> renderShapeDetails [

	super renderShapeDetails.

	label := RSLabel new
		         color: Color black;
					fontSize: 17;
					bold;
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
