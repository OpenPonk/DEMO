Class {
	#name : 'OPDemoMultipleInternalTransactionShape',
	#superclass : 'OPDemoElementShape',
	#instVars : [
		'multipleSquare'
	],
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPDemoMultipleInternalTransactionShape >> attachedShapes [

	^ super attachedShapes , {
		  label.
		  square.
		  multipleSquare }
]

{ #category : 'rendering' }
OPDemoMultipleInternalTransactionShape >> renderBasicShape [

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
OPDemoMultipleInternalTransactionShape >> renderShapeDetails [
	|llocation slocation mslocation|
	super renderShapeDetails.
	label := RSLabel new
		         color: Color black;
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

{ #category : 'rendering' }
OPDemoMultipleInternalTransactionShape >> selectableInteraction [

	^ OPRSSelectable highlightBorderColorBlue
]

{ #category : 'rendering' }
OPDemoMultipleInternalTransactionShape >> updateRenderFromModel [

	label text: self modelElement name.
	square borderColor: self modelElement typeColor .
	"square borderColor: (self modelElement isFinal
			 ifTrue: [ Color black ]
			 ifFalse: [ Color transparent ])."
	super updateRenderFromModel.
	roassalShape signalUpdate
]
