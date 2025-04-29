Class {
	#name : 'OPDemoNavigatorAdapterTest',
	#superclass : 'OPNavigatorAdaptersTest',
	#instVars : [
		'adapterTest',
		'demoTest',
		'transactionTest',
		'actorTest',
		'initiatorLinkTest',
		'scopeOfInterestTest',
		'accessLinkTest',
		'factsTest',
		'transactionBTest'
	],
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'accessing' }
OPDemoNavigatorAdapterTest >> adapterClass [
	^ OPDemoNavigatorAdapter
]

{ #category : 'accessing' }
OPDemoNavigatorAdapterTest >> childrenFor: anObject equals: aCollection [
	^ self assertCollection: (adapterTest childrenFor: anObject) hasSameElements: aCollection
]

{ #category : 'accessing' }
OPDemoNavigatorAdapterTest >> displayFor: anObject equals: aString [
	^ self assert: (adapterTest displayFor: anObject) equals: aString
]

{ #category : 'accessing' }
OPDemoNavigatorAdapterTest >> setUp [
	super setUp.
	adapterTest := self adapterClass new.
	demoTest := OPDemo named: 'DEMO'.
	transactionTest := OPDemoStandardInternalTransaction named: 'Transaction'.
	scopeOfInterestTest := OPDemoScopeOfInterest named: 'ScopeOfInterest'.
	factsTest := OPDemoFacts named: 'Fact Bank'.
	actorTest := OPDemoInternalActor named: 'Actor Role'.
	accessLinkTest := OPDemoAccessLink from: factsTest to: scopeOfInterestTest.
	initiatorLinkTest := OPDemoTargetInitiatorLink from: actorTest to: transactionTest.
	transactionBTest := OPDemoStandardInternalTransaction named: 'TransactionB'.
	demoTest
		add: transactionTest;
		add: scopeOfInterestTest;
		add: factsTest.
	scopeOfInterestTest
		add: actorTest.
	demoTest
		add: accessLinkTest;
		add: initiatorLinkTest.
	actorTest
		add: transactionBTest.
]

{ #category : 'tests' }
OPDemoNavigatorAdapterTest >> testChildren [
	self
		childrenFor: demoTest 
		equals: (Array with: transactionTest with: scopeOfInterestTest with: factsTest).
	self childrenFor: transactionTest equals: {initiatorLinkTest}.
	self childrenFor: factsTest equals: { accessLinkTest }.
	self childrenFor: scopeOfInterestTest equals: { actorTest . accessLinkTest }.
	self childrenFor: actorTest equals: { initiatorLinkTest . transactionBTest }.
]

{ #category : 'tests' }
OPDemoNavigatorAdapterTest >> testDisplay [
	self displayFor: demoTest equals: demoTest name , ' (Diagram)'.
	self displayFor: transactionTest equals: transactionTest name , ' (Standard Internal Transaction)'.
	self displayFor: scopeOfInterestTest equals: scopeOfInterestTest name , ' (Scope of Interest)'.
	self displayFor: factsTest equals: factsTest name , ' (Fact Bank)'.
	self displayFor: actorTest equals: actorTest name , ' (Internal Actor Role)'.
	self displayFor: accessLinkTest equals: accessLinkTest name , ' (Access Link)'.
	self displayFor: initiatorLinkTest equals: initiatorLinkTest name , ' (Initiator Link)'.
]
