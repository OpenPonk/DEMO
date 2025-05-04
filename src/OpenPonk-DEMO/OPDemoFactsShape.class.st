"
I am implementing rules for displaying a Fact Bank
"
Class {
	#name : 'OPDemoFactsShape',
	#superclass : 'OPDemoElementShape',
	#instVars : [
		'multipleSquare',
		'label_second'
	],
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'accessing' }
OPDemoFactsShape >> attachedCircle [
	^ multipleSquare 
]

{ #category : 'accessing' }
OPDemoFactsShape >> attachedShapes [

	^ super attachedShapes , {
		  label.
		  square.
		  label_second.
		  multipleSquare }
]

{ #category : 'accessing' }
OPDemoFactsShape >> attachedSquare [
	^ square 
]

{ #category : 'rendering' }
OPDemoFactsShape >> labelSecond [
	^ label_second 
]

{ #category : 'accessing' }
OPDemoFactsShape >> renderBasicShape [

	^ RSCircle new
		  size: 40;
		  color: Color gray;
		  border: (RSBorder new
				   color: Color black;
				   width: 1.5;
				   yourself);
		  yourself
]

{ #category : 'rendering' }
OPDemoFactsShape >> renderShapeDetails [
	|llocation slocation mslocation |
	super renderShapeDetails.
	label_second := RSLabel new
		         color: Color black;
		         height: 11;
		         model: self;
		         yourself.
	llocation := RSLocation new.
	llocation offset: -6@(-30).
	llocation stick: label_second on: self roassalShape.
	label := RSLabel new
		         color: Color black;
					bold;
		         height: 11;
		         model: self;
		         yourself.
	llocation := RSLocation new.
	llocation offset: -8@0.
	llocation stick: label on: self roassalShape.
	square := RSBox new
		               size: 28;
		               color: Color transparent;
		               model: self;
							borderColor: Color black;
							borderWidth: 1.5;
							rotateByDegrees: 45;
		               yourself.
	slocation := RSLocation new.
	slocation offset: -8@0.
	slocation stick: square on: self roassalShape.
	multipleSquare := RSCircle new
		               size: 40;
		               color: Color gray ;
		               model: self;
							borderColor: Color black;
							borderWidth: 1.5;
							rotateByDegrees: 45;
		               yourself.
	mslocation := RSLocation new.
	mslocation offset: -8@0.
	mslocation stick: multipleSquare on: self roassalShape.
	self canvas
		add: multipleSquare;
		add: square;
		add: label;
		add: label_second
]

{ #category : 'rendering' }
OPDemoFactsShape >> updateRenderFromModel [

	label text: self modelElement name.
	label_second text: self modelElement labelFacts.
	super updateRenderFromModel.
	roassalShape signalUpdate
]
