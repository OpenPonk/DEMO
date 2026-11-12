"
Unit tests for OPDemoCompositeActorShape.
Verifies the lifecycle and structural properties of composite actor diagram elements.
"
Class {
	#name : 'OPDemoCompositeActorShapeTest',
	#superclass : 'OPDemoShapeTest',
	#category : 'OpenPonk-DEMO-Tests-DiagramElements',
	#package : 'OpenPonk-DEMO-Tests',
	#tag : 'DiagramElements'
}

{ #category : 'instance creation' }
OPDemoCompositeActorShapeTest >> modelClass [
	^ OPDemoCompositeActor
]

{ #category : 'hooks' }
OPDemoCompositeActorShapeTest >> shapeClass [
	^ OPDemoCompositeActorShape 
]

{ #category : 'instance creation' }
OPDemoCompositeActorShapeTest >> testAdd [
	shape modelElement: OPDemoCompositeActor new.
	shape renderBasicShapeIn: canvas.
	self
		assertCollection: canvas nodes asSet
		equals:
			({ shape } asSet , shape ownedElements collect:
				 #roassalShape)
]

{ #category : 'instance creation' }
OPDemoCompositeActorShapeTest >> testRemove [

	shape modelElement: OPDemoCompositeActor new.
	self assertEmpty: canvas nodes.
	shape renderBasicShapeIn: canvas.
	self denyEmpty: canvas nodes.
	shape remove.
	self assertEmpty: canvas nodes
]
