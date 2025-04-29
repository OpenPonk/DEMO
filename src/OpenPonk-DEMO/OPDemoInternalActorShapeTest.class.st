Class {
	#name : 'OPDemoInternalActorShapeTest',
	#superclass : 'OPDemoShapeTest',
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'hooks' }
OPDemoInternalActorShapeTest >> modelClass [
	^ OPDemoInternalActor
]

{ #category : 'hooks' }
OPDemoInternalActorShapeTest >> shapeClass [
	^ OPDemoInternalActorShape 
]

{ #category : 'hooks' }
OPDemoInternalActorShapeTest >> testAdd [
	shape modelElement: OPDemoInternalActor new.
	shape renderBasicShapeIn: canvas.
	self
		assertCollection: canvas nodes asSet
		equals:
			({ shape } asSet , shape ownedElements collect:
				 #roassalShape)
]

{ #category : 'hooks' }
OPDemoInternalActorShapeTest >> testRemove [
	shape modelElement: OPDemoInternalActor new.
	self assert: canvas nodes isEmpty.
	shape renderBasicShapeIn: canvas.
	self assert: canvas nodes isNotEmpty.
	shape remove.
	self assert: canvas nodes isEmpty.
]
