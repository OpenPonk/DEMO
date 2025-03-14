Class {
	#name : 'OPDemoLinkLableShape',
	#superclass : 'OPEdgeLabel',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'adding' }
OPDemoLinkLableShape >> defaultAnchorConstraintPosition [

	^ OPRSAnchorConstraintBalanceReference balance: 0.2
]

{ #category : 'adding' }
OPDemoLinkLableShape >> defaultMinDistance [

	^ 5
]

{ #category : 'accessing' }
OPDemoLinkLableShape >> defaultText [

	^ self modelElement name
]

{ #category : 'adding' }
OPDemoLinkLableShape >> renderShapeDetails [

	super renderShapeDetails.
	self roassalShape
		when: RSMouseDoubleClick
		do: [ :evt | OPRenameElementCommand executeOn: self modelElement ]
		for: self
]
