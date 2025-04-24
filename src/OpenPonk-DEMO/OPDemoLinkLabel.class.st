Class {
	#name : 'OPDemoLinkLabel',
	#superclass : 'OPEdgeLabel',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'as yet unclassified' }
OPDemoLinkLabel >> defaultAnchorConstraintPosition [

	^ OPRSAnchorConstraintBalanceReference balance: 0.2
]

{ #category : 'as yet unclassified' }
OPDemoLinkLabel >> defaultMinDistance [

	^ 5
]

{ #category : 'as yet unclassified' }
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
