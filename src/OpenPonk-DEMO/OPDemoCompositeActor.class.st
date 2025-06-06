"
I am a class representing a composite Actor Role model
"
Class {
	#name : 'OPDemoCompositeActor',
	#superclass : 'OPDemoActor',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'testing' }
OPDemoCompositeActor class >> isComposite [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	||
	^ super isComposite 
]

{ #category : 'testing' }
OPDemoCompositeActor >> isComposite [
	^ true 
]

{ #category : 'testing' }
OPDemoCompositeActor >> isInternal [
	^ false
]
