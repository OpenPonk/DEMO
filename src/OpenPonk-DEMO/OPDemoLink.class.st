"
I am responsible for representing a model for any kind of a Link
"
Class {
	#name : 'OPDemoLink',
	#superclass : 'OPModelObject',
	#instVars : [
		'source',
		'target'
	],
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'instance creation' }
OPDemoLink class >> from: aSource to: aTarget [
	^ self new
		source: aSource;
		target: aTarget;
		yourself
]

{ #category : 'instance creation' }
OPDemoLink class >> from: aSource to: aTarget named: aString [
	^ self new
		source: aSource;
		target: aTarget;
		name: aString;
		yourself
]

{ #category : 'testing' }
OPDemoLink >> allEdges [
	^ self
]

{ #category : 'testing' }
OPDemoLink >> asEdge [
	^ self
]

{ #category : 'testing' }
OPDemoLink >> isEdge [
	^ true
]

{ #category : 'testing' }
OPDemoLink >> isNode [
	^ false
]

{ #category : 'testing' }
OPDemoLink >> source [
	^ source
]

{ #category : 'testing' }
OPDemoLink >> source: aSource [
	source := aSource
]

{ #category : 'testing' }
OPDemoLink >> target [
	^ target
]

{ #category : 'testing' }
OPDemoLink >> target: aTarget [
	target := aTarget
]
