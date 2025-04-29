Class {
	#name : 'OPDemoCompositeActorRoassalTest',
	#superclass : 'OPDemoRoassalTest',
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'accessing' }
OPDemoCompositeActorRoassalTest >> controllerClass [
	^ OPDemoCompositeActorController 
]

{ #category : 'construction' }
OPDemoCompositeActorRoassalTest >> diagramElementClass [

	^ OPDemoCompositeActorShape 
]

{ #category : 'accessing' }
OPDemoCompositeActorRoassalTest >> modelClass [
	^ OPDemoCompositeActor
]

{ #category : 'accessing' }
OPDemoCompositeActorRoassalTest >> testCreateUsingAddAsTarget [
	self setUp.
	super testCreateUsingAddAsTarget.
	self assert: (controller roassalShape isKindOf: RSBox).
	self assert: controller roassalShape color equals: Color gray.
	self assert: controller roassalShape border color equals: Color black.
	self assert: controller roassalShape extent x equals: (actorWidthHeight + actorBorderSize ).
	self assert: controller roassalShape extent y equals: (actorWidthHeight + actorBorderSize ).
]
