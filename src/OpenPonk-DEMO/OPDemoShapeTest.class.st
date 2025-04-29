Class {
	#name : 'OPDemoShapeTest',
	#superclass : 'OPAbstractNodeTest',
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'instance creation' }
OPDemoShapeTest >> modelClass [

	^ self subclassResponsibility
]

{ #category : 'hooks' }
OPDemoShapeTest >> shapeClass [
	^ self subclassResponsibility
]
