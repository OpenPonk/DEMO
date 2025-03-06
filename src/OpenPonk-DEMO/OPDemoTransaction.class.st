Class {
	#name : 'OPDemoTransaction',
	#superclass : 'OPDemoElement',
	#instVars : [
		'isComposite',
		'isMultiple'
	],
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'accessing' }
OPDemoTransaction >> beComposite [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	isComposite := true
]

{ #category : 'accessing' }
OPDemoTransaction >> beInternal [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	isComposite := false
]

{ #category : 'accessing' }
OPDemoTransaction >> beMultiple [ 
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	isMultiple := true
]

{ #category : 'accessing' }
OPDemoTransaction >> beMultiple: beMul beComposite: beCom [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	isMultiple := beMul.
	isComposite  := beCom .
]

{ #category : 'accessing' }
OPDemoTransaction >> beStandard [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	isMultiple := false
]

{ #category : 'testing' }
OPDemoTransaction >> isComposite [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	^ isComposite 
]

{ #category : 'testing' }
OPDemoTransaction >> isEdge [
	^ false
]

{ #category : 'testing' }
OPDemoTransaction >> isMultiple [ 
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	^ isMultiple 
]

{ #category : 'testing' }
OPDemoTransaction >> isNode [
	^ true
]
