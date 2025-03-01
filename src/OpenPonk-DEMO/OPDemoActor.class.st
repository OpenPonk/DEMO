Class {
	#name : 'OPDemoActor',
	#superclass : 'OPDemoElement',
	#instVars : [
		'isComposite'
	],
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
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
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	||
	^ isComposite 
]

{ #category : 'testing' }
OPDemoActor >> isInternal [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	||
	^ isComposite not
]
