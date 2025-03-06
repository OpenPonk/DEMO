Class {
	#name : 'OPDemoPlugin',
	#superclass : 'OPPlugin',
	#category : 'OpenPonk-DEMO-Plugin',
	#package : 'OpenPonk-DEMO',
	#tag : 'Plugin'
}

{ #category : 'accessing' }
OPDemoPlugin >> diagramControllerClass [
	^ OPDemoController
]

{ #category : 'accessing' }
OPDemoPlugin >> extent [ 
	^true
]

{ #category : 'accessing' }
OPDemoPlugin >> icon [
	^ OPCoreIcons opFsmDiagramIcon
	"TODO"
	"^ OPCoreIcons opDemoDiagramIcon"
	"^ Smalltalk ui icons addName: #bookmark"
	"^ Icon"
]

{ #category : 'accessing' }
OPDemoPlugin >> layouterClass [

	^ OPDemoLayouter 
]

{ #category : 'accessing' }
OPDemoPlugin >> modelClass [ 
	^ OPDemo
]

{ #category : 'accessing' }
OPDemoPlugin >> modelSerializerClass [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
OPDemoPlugin >> name [
	^ 'DEMO Diagram'
]

{ #category : 'accessing' }
OPDemoPlugin >> supportsHidingElements [
	^ true
]
