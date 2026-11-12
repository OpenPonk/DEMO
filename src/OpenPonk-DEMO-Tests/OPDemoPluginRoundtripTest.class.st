"
Verifies the serialization and deserialization roundtrip persistence for DEMO models and diagrams.
"
Class {
	#name : 'OPDemoPluginRoundtripTest',
	#superclass : 'OPAbstractPluginExampleRoundtripTest',
	#category : 'OpenPonk-DEMO-Tests-Plugin',
	#package : 'OpenPonk-DEMO-Tests',
	#tag : 'Plugin'
}

{ #category : 'accessing' }
OPDemoPluginRoundtripTest class >> pluginClass [
	^ OPDemoPlugin
]
