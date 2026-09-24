Class {
	#name : 'OPDemoPluginLifecycleTest',
	#superclass : 'OPAbstractPluginExampleLifecycleTest',
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'accessing' }
OPDemoPluginLifecycleTest class >> pluginClass [
	"Answers the OPPlugin class under test."
	^ OPDemoPlugin
]
