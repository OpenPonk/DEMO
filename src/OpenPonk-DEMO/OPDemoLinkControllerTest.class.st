Class {
	#name : 'OPDemoLinkControllerTest',
	#superclass : 'OPAbstractDirectionalRelationshipControllerTest',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'testing' }
OPDemoLinkControllerTest class >> isAbstract [
	^ self == OPDemoLinkControllerTest
]

{ #category : 'accessing' }
OPDemoLinkControllerTest >> diagramControllerClass [
	^ OPDemoController
]

{ #category : 'accessing' }
OPDemoLinkControllerTest >> diagramModelClass [
	^ OPDemo
]
