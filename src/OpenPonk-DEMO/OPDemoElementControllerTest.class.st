"
Abstract base class for DEMO Roassal diagram element tests.
Provides shared setup and utility methods for testing rendering logic and layout properties of DEMO diagram elements.
"
Class {
	#name : 'OPDemoElementControllerTest',
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
OPDemoElementControllerTest class >> isAbstract [
	^ self = OPDemoElementControllerTest
]

{ #category : 'constants' }
OPDemoElementControllerTest >> diagramControllerClass [
	^ OPDemoController
]

{ #category : 'constants' }
OPDemoElementControllerTest >> diagramModelClass [
	^ OPDemo
]

{ #category : 'running' }
OPDemoElementControllerTest >> setUp [
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
