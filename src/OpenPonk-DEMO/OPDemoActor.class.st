Class {
	#name : 'OPDemoActor',
	#superclass : 'OPDemoElement',
	#instVars : [
		'isComposite'
	],
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'accessing' }
OPDemoActor >> beComposite [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	||
	isComposite := true
]

{ #category : 'accessing' }
OPDemoActor >> beInternal [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	||
	isComposite := false
]

{ #category : 'testing' }
OPDemoActor >> isComposite [
	^ self subclassResponsibility
]

{ #category : 'testing' }
OPDemoActor >> isComposite: aBoolean [
	isComposite := aBoolean.
	self changed
]

{ #category : 'testing' }
OPDemoActor >> isEdge [
	^ false
]

{ #category : 'testing' }
OPDemoActor >> isInternal [
	^ self subclassResponsibility
]

{ #category : 'testing' }
OPDemoActor >> isNode [
	^ true
]
