"
I represent a class storing the main rules about the plugin itself

I am basically mapping the top-level controllers, models and so on
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

{ #category : 'accessing' }
OPDemoPlugin >> supportsHidingElements [
	^ true
]
