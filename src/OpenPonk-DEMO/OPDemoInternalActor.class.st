Class {
	#name : 'OPDemoInternalActor',
	#superclass : 'OPDemoActor',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'acccessing' }
OPDemoInternalActor >> beComposite [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	|newCompositeActor|
	super beComposite .
	newCompositeActor := OPDemoCompositeActor new.
	^ newCompositeActor 
]

{ #category : 'initialization' }
OPDemoInternalActor >> initialize [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	||
	super beInternal.
]

{ #category : 'testing' }
OPDemoInternalActor >> isComposite [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	|bool_var|
	bool_var := super isComposite .
	^ bool_var 
]

{ #category : 'testing' }
OPDemoInternalActor >> isInternal [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	^ super isInternal 
]
