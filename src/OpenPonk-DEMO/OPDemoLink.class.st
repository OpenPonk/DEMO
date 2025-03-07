Class {
	#name : 'OPDemoLink',
	#superclass : 'OPModelObject',
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
OPDemoLink >> isEdge [
	^ true
]

{ #category : 'testing' }
OPDemoLink >> isNode [
	^ false
]
