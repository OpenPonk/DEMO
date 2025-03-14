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
	^ false
]

{ #category : 'testing' }
OPDemoInternalActor >> isEdge [
	^ false
]

{ #category : 'testing' }
OPDemoInternalActor >> isInternal [
	^ true
]

{ #category : 'testing' }
OPDemoInternalActor >> isNode [
	^ true
]
