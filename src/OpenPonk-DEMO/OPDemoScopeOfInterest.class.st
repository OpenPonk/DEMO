Class {
	#name : 'OPDemoScopeOfInterest',
	#superclass : 'OPDemoElement',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'accessing' }
OPDemoScopeOfInterest >> nodes [
	^ elements select: [ :each | each isNode ]
]
