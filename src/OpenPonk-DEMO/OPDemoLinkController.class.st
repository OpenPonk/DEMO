Class {
	#name : 'OPDemoLinkController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-DiagramControllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramControllers'
}

{ #category : 'construction' }
OPDemoLinkController >> diagramElementClass [

	^ OPDemoLinkController 
]

{ #category : 'accessing' }
OPDemoLinkController >> modelClass [
	^ OPDemoLink
]
