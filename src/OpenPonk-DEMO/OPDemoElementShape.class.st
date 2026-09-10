"
I am an abstract diagram element (node) representing a DEMO element.
I define the base rules for displaying elements, creating the underlying Roassal shape, labels, and bounding boxes.
"
Class {
	#name : 'OPDemoElementShape',
	#superclass : 'OPBoundNode',
	#instVars : [
		'label',
		'square'
	],
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPDemoElementShape >> labelFirst [
	^ label
]

{ #category : 'interactions' }
OPDemoElementShape >> selectableInteraction [

	^ OPRSSelectable highlightBorderColorBlue
]

{ #category : 'rendering' }
OPDemoElementShape >> updateMultilineLabel: aComposite withText: anObject fontSize: anInteger bold: aBoolean [

	| rawString textLines |
	aComposite children copy do: [ :each | aComposite removeShape: each ].
	rawString := anObject ifNil: [ '' ] ifNotNil: [ :object | object asString ].
	textLines := rawString lines.
	textLines ifEmpty: [ textLines := #( '' ) ].
	aComposite addAll: (textLines collect: [ :eachLine |
				 | lbl |
				 lbl := RSLabel new
					        text: eachLine;
					        color: Color black;
					        fontSize: anInteger;
					        yourself.
				 aBoolean ifTrue: [ lbl bold ].
				 lbl ]).
	RSVerticalLineLayout new
		alignCenter;
		verticalGap: 2;
		on: aComposite children.
	aComposite adjustToChildren
]
