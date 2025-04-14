Class {
	#name : 'OPDemoScopeOfInterest',
	#superclass : 'OPDemoElement',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'accessing' }
OPDemoScopeOfInterest >> edges [
	^ elements select: [ :each | each isEdge ]
]

{ #category : 'accessing' }
OPDemoScopeOfInterest >> nodes [
	^ elements select: [ :each | each isNode ]
]
