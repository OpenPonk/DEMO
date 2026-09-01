"
View model for DEMO target initiator links.
Handles model attachment logic between a transaction and an initiator, and provides icons for the UI layer.
"
Class {
	#name : 'OPDemoTargetInitiatorLinkViewModel',
	#superclass : 'OPDemoLinkViewModel',
	#category : 'OpenPonk-DEMO-ViewModels',
	#package : 'OpenPonk-DEMO',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPDemoTargetInitiatorLinkViewModel class >> modelClass [ ^ OPDemoTargetInitiatorLink
]

{ #category : 'construction' }
OPDemoTargetInitiatorLinkViewModel >> attachModelFrom: sourceViewModel to: targetViewModel [
	self model source: sourceViewModel model.
	self model target: targetViewModel model.
]

{ #category : 'accessing' }
OPDemoTargetInitiatorLinkViewModel >> icon [ ^ OPDemoEditorIcons initiatorLinkTarget16Icon
]
