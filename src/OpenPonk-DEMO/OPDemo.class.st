Class {
	#name : 'OPDemo',
	#superclass : 'OPModelObject',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'accessing' }
OPDemo >> edges [
	^ elements select: [ :each | each isEdge ]
	
"edges
	^ elements select: [ :each |
		(each isKindOf: OPDemoScopeOfInterest)
			ifTrue: [ 
				^ each edges
				 ]
			ifFalse: [ each isEdge ]
	]"
]

{ #category : 'testing' }
OPDemo >> isEdge [
	^ false
]

{ #category : 'testing' }
OPDemo >> isNode [
	^ false
]

{ #category : 'accessing' }
OPDemo >> nodes [
	^ elements select: [ :each | each isNode ]
	
"nodes
	^ elements flatCollect: [ :each |
		(each isNode)
			ifTrue: [
				(each isKindOf: OPDemoActor)
					ifTrue: [ { each } , each transactions ]
					ifFalse: [ { each } ]
			]
			ifFalse: [ #() ]
	]."

]
