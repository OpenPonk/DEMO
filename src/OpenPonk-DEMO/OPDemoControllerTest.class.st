Class {
	#name : 'OPDemoControllerTest',
	#superclass : 'OPAbstractDiagramControllerTest',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoControllerTest >> controllerClass [
	^ OPDemoController
]

{ #category : 'accessing' }
OPDemoControllerTest >> diagramModelClass [
	^ OPDemo
]

{ #category : 'accessing' }
OPDemoControllerTest >> modelClass [
	^ OPDemo
]

{ #category : 'tests' }
OPDemoControllerTest >> testControllerFactory [
	self assert: controller controllerFactory isNotNil.
	self assert: (controller controllerFactory isKindOf: OPControllerFactory)
]

{ #category : 'tests' }
OPDemoControllerTest >> testInitializePalette [
	| palette |
	palette := OPPalette new.
	controller initializePalette: palette.
	self denyCollection: palette items hasSameElements: #()
]
