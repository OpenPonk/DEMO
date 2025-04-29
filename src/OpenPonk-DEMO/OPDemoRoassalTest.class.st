Class {
	#name : 'OPDemoRoassalTest',
	#superclass : 'OPAbstractElementControllerTest',
	#instVars : [
		'actorBorderSize',
		'transactionBorderSize',
		'actorWidthHeight',
		'transactionWidthHeight',
		'factsHeightWidth',
		'scopeOfInterestHeight',
		'scopeOfInterestWidth',
		'scopeOfInterestBorderSize'
	],
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'accessing' }
OPDemoRoassalTest >> controllerClass [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
OPDemoRoassalTest >> diagramControllerClass [
	^ OPDemoController
]

{ #category : 'accessing' }
OPDemoRoassalTest >> diagramElementClass [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
OPDemoRoassalTest >> diagramModelClass [
	^ OPDemo
]

{ #category : 'accessing' }
OPDemoRoassalTest >> modelClass [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
OPDemoRoassalTest >> setUp [
	super setUp.
	actorBorderSize := 2.
	transactionBorderSize := 1.5.
	actorWidthHeight := 100.
	transactionWidthHeight := 70.
	factsHeightWidth := 40.
	scopeOfInterestHeight := 600.
	scopeOfInterestWidth := 800.
	scopeOfInterestBorderSize := 6.
]
