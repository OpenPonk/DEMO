"
Verifies ViewModel contracts across all bundled DEMO example templates.
"
Class {
	#name : 'OPDemoPluginViewModelTest',
	#superclass : 'OPAbstractPluginExampleViewModelTest',
	#category : 'OpenPonk-DEMO-Tests-Plugin',
	#package : 'OpenPonk-DEMO-Tests',
	#tag : 'Plugin'
}

{ #category : 'accessing' }
OPDemoPluginViewModelTest class >> pluginClass [

	^ OPDemoPlugin
]
