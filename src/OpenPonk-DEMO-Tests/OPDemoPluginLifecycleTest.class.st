"
Verifies the initialization, registration, and shutdown lifecycle of the DEMO plugin.
"
Class {
	#name : 'OPDemoPluginLifecycleTest',
	#superclass : 'OPAbstractPluginExampleLifecycleTest',
	#category : 'OpenPonk-DEMO-Tests-Plugin',
	#package : 'OpenPonk-DEMO-Tests',
	#tag : 'Plugin'
}

{ #category : 'accessing' }
OPDemoPluginLifecycleTest class >> pluginClass [
	"Answers the OPPlugin class under test."
	^ OPDemoPlugin
]
