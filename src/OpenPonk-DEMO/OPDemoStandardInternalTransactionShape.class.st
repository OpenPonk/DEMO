"
I am a diagram element representing a DEMO standard internal transaction.
I manage the rendering details and attached shapes of its underlying Roassal shape.
"
Class {
	#name : 'OPDemoStandardInternalTransactionShape',
	#superclass : 'OPDemoTransactionShape',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'accessing' }
OPDemoStandardInternalTransactionShape >> attachedShapes [

	^ super attachedShapes , {
		  label.
		  square}
]

{ #category : 'rendering' }
OPDemoStandardInternalTransactionShape >> renderShapeDetails [

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
						   borderColor: Color red;
							borderWidth: 1.5;
							rotateByDegrees: 45;
		               yourself.
	RSLocation new stick: square on: self roassalShape.
	self canvas
		add: label;
		add: square
]
