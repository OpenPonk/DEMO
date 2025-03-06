Class {
	#name : 'OPDemoElementController',
	#superclass : 'OPElementController',
	#instVars : [
		'element_id'
	],
	#category : 'OpenPonk-DEMO-DiagramControllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramControllers'
}

{ #category : 'construction' }
OPDemoElementController >> diagramElementClass [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
OPDemoElementController >> modelClass [
	^ self subclassResponsibility
]
