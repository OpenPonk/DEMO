"
I am an abstract parent class for classes responsible for Transactions design
"
Class {
	#name : 'OPDemoTransactionShape',
	#superclass : 'OPDemoElementShape',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPDemoTransactionShape >> renderBasicShape [

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
OPDemoTransactionShape >> updateRenderFromModel [

	label text: self modelElement name.
	square borderColor: self modelElement typeColor .
	"square borderColor: (self modelElement isFinal
			 ifTrue: [ Color black ]
			 ifFalse: [ Color transparent ])."
	super updateRenderFromModel.
	roassalShape signalUpdate
]
