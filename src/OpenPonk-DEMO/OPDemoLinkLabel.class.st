"
I am a diagram element representing a label attached to a DEMO link.
I manage the textual rendering, anchoring, and positioning along the link's underlying Roassal shape.
"
Class {
	#name : 'OPDemoLinkLabel',
	#superclass : 'OPEdgeLabel',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'adding' }
OPDemoLinkLabel >> defaultAnchorConstraintPosition [

	^ OPRSAnchorConstraintBalanceReference balance: 0.2
]

{ #category : 'adding' }
OPDemoLinkLabel >> defaultMinDistance [

	^ 5
]

{ #category : 'accessing' }
OPDemoLinkLabel >> defaultText [

	^ self modelElement name
]

{ #category : 'rendering' }
OPDemoLinkLabel >> renderShapeDetails [

	super renderShapeDetails.
	self roassalShape
		when: RSMouseDoubleClick
		do: [ :evt | OPRenameElementCommand executeOn: self modelElement ]
		for: self
]
