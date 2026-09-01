"
Defines the plugin configuration for DEMO CSD. Maps top-level controllers, models, view models, and serializers for the OpenPonk framework.
"
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
OPDemoPlugin >> icon [
	^ OPDemoEditorIcons demo16Icon
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
	^ OPStonModelSerializer
]

{ #category : 'accessing' }
OPDemoPlugin >> name [
	^ 'DEMO Diagram'
]

{ #category : 'testing' }
OPDemoPlugin >> supportsHidingElements [
	^ true
]
