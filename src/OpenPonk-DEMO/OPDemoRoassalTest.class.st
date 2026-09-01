"
Abstract base class for DEMO Roassal diagram element tests.
Provides shared setup and utility methods for testing rendering logic and layout properties of DEMO diagram elements.
"
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

{ #category : 'testing' }
OPDemoRoassalTest class >> isAbstract [
	^ self = OPDemoRoassalTest
]

{ #category : 'constants' }
OPDemoRoassalTest >> diagramControllerClass [
	^ OPDemoController
]

{ #category : 'constants' }
OPDemoRoassalTest >> diagramModelClass [
	^ OPDemo
]

{ #category : 'running' }
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
