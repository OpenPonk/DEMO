"
I am in charge of displaying a multiple composite Transaction
"
Class {
	#name : 'OPDemoMultipleCompositeTransactionShape',
	#superclass : 'OPDemoTransactionShape',
	#instVars : [
		'multipleSquare'
	],
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'accessing' }
OPDemoMultipleCompositeTransactionShape >> attachedCircle [
	^ multipleSquare 
]

{ #category : 'accessing' }
OPDemoMultipleCompositeTransactionShape >> attachedShapes [

	^ super attachedShapes , {
		  label.
		  square.
		  multipleSquare }
]

{ #category : 'accessing' }
OPDemoMultipleCompositeTransactionShape >> renderBasicShape [

	^ super renderBasicShape color: Color gray;
	yourself
]

{ #category : 'rendering' }
OPDemoMultipleCompositeTransactionShape >> renderShapeDetails [
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
							borderColor: Color black;
							borderWidth: 1.5;
							rotateByDegrees: 45;
		               yourself.
	slocation := RSLocation new.
	slocation offset: -10@0.
	slocation stick: square on: self roassalShape.
	multipleSquare := RSCircle new
		               size: 70;
		               color: Color gray ;
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
