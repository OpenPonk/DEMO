"
Model representing a Fact Bank element in a DEMO CSD diagram.
It stores facts and their associated labels, denoting a passive information store in the organization.
"
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
