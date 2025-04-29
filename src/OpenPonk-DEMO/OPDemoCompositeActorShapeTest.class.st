Class {
	#name : 'OPDemoCompositeActorShapeTest',
	#superclass : 'OPDemoShapeTest',
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'instance creation' }
OPDemoCompositeActorShapeTest >> modelClass [
	^ OPDemoCompositeActor
]

{ #category : 'instance creation' }
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
	self assert: canvas nodes isEmpty.
	shape renderBasicShapeIn: canvas.
	self assert: canvas nodes isNotEmpty.
	shape remove.
	self assert: canvas nodes isEmpty.
]
