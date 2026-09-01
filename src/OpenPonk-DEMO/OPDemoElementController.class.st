"
Abstract base controller for DEMO node elements. Determines connection rules (valid source/target) and manages the diagram lifecycle of the node.
"
Class {
	#name : 'OPDemoElementController',
	#superclass : 'OPElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'connecting' }
OPDemoElementController >> canBeSourceFor: aController [
	^ (aController respondsTo: #modelClass) and:
	[aController modelClass = OPDemoAccessLink]
]

{ #category : 'connecting' }
OPDemoElementController >> canBeTargetFor: aController [
	^ self canBeSourceFor: aController
]
