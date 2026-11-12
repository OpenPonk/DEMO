"
Abstract base class for DEMO diagram element tests.
Verifies the lifecycle (add, remove) and properties of basic DEMO diagram shapes/nodes.
"
Class {
	#name : 'OPDemoShapeTest',
	#superclass : 'OPAbstractNodeTest',
	#category : 'OpenPonk-DEMO-Tests-DiagramElements',
	#package : 'OpenPonk-DEMO-Tests',
	#tag : 'DiagramElements'
}

{ #category : 'testing' }
OPDemoShapeTest class >> isAbstract [
	^ self = OPDemoShapeTest
]
