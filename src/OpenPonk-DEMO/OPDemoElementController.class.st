Class {
	#name : 'OPDemoElementController',
	#superclass : 'OPElementController',
	#instVars : [
		'element_id'
	],
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoElementController >> diagramElementClass [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
OPDemoElementController >> modelClass [
	^ self subclassResponsibility
]
