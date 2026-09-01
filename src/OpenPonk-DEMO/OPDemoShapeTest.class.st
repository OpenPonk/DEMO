"
Abstract base class for DEMO diagram element tests.
Verifies the lifecycle (add, remove) and properties of basic DEMO diagram shapes/nodes.
"
Class {
	#name : 'OPDemoShapeTest',
	#superclass : 'OPAbstractNodeTest',
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'testing' }
OPDemoShapeTest class >> isAbstract [
	^ self = OPDemoShapeTest
]
