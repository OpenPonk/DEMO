"
I am a diagram element representing a DEMO multiple internal transaction.
I manage the rendering details of its underlying Roassal shape, including multiple square and circle indicators.
"
Class {
	#name : 'OPDemoMultipleInternalTransactionShape',
	#superclass : 'OPDemoTransactionShape',
	#instVars : [
		'multipleSquare'
	],
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPDemoMultipleInternalTransactionShape >> attachedCircle [
	^ multipleSquare 
]

{ #category : 'accessing' }
OPDemoMultipleInternalTransactionShape >> attachedShapes [

	^ super attachedShapes , {
		  label.
		  square.
		  multipleSquare }
]

{ #category : 'rendering' }
OPDemoMultipleInternalTransactionShape >> renderShapeDetails [
	|llocation slocation mslocation|
	super renderShapeDetails.
	label := RSLabel new
		         color: Color black;
					fontSize: 17;
					bold;
		         height: 11;
		         model: self;
		         yourself.
	llocation := RSLocation new.
	llocation offset: -10@0.
	llocation stick: label on: self roassalShape.
	square := RSBox new
		               size: 50;
		               color: Color transparent;
		               model: self;
							borderColor: Color red;
							borderWidth: 1.5;
							rotateByDegrees: 45;
		               yourself.
	slocation := RSLocation new.
	slocation offset: -10@0.
	slocation stick: square on: self roassalShape.
	multipleSquare := RSCircle new
		               size: 70;
		               color: Color white ;
		               model: self;
							borderColor: Color black;
							borderWidth: 1.5;
							rotateByDegrees: 45;
		               yourself.
	mslocation := RSLocation new.
	mslocation offset: -10@0.
	mslocation stick: multipleSquare on: self roassalShape.
	self canvas
		add: multipleSquare;
		add: square;
		add: label
]
