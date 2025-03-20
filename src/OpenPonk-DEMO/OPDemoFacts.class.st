Class {
	#name : 'OPDemoFacts',
	#superclass : 'OPDemoElement',
	#instVars : [
		'labelFacts'
	],
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'initialization' }
OPDemoFacts >> initialize [ 
	super initialize.
	labelFacts := 'Facts'
]

{ #category : 'accessing' }
OPDemoFacts >> labelFacts [
	^ labelFacts
]

{ #category : 'accessing' }
OPDemoFacts >> labelFacts: aString [
	labelFacts := aString
]
