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
OPDemoCompositeActor >> isEdge [
	^ false
]

{ #category : 'testing' }
OPDemoCompositeActor >> isInternal [
	^ false
]

{ #category : 'testing' }
OPDemoCompositeActor >> isNode [
	^ true
]
