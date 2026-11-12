"
Abstract base test suite providing shared assertions for DEMO link controllers.
"
Class {
	#name : 'OPDemoLinkControllerTest',
	#superclass : 'OPAbstractDirectionalRelationshipControllerTest',
	#category : 'OpenPonk-DEMO-Tests-Controllers',
	#package : 'OpenPonk-DEMO-Tests',
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
