"
View model for DEMO source initiator (executor) links.
Handles model attachment logic between source and target elements and provides icons for the UI layer.
"
Class {
	#name : 'OPDemoSourceInitiatorLinkViewModel',
	#superclass : 'OPDemoLinkViewModel',
	#category : 'OpenPonk-DEMO-ViewModels',
	#package : 'OpenPonk-DEMO',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPDemoSourceInitiatorLinkViewModel class >> modelClass [ ^ OPDemoSourceInitiatorLink
]

{ #category : 'construction' }
OPDemoSourceInitiatorLinkViewModel >> attachModelFrom: sourceViewModel to: targetViewModel [
	self model source: sourceViewModel model.
	self model target: targetViewModel model.
]

{ #category : 'accessing' }
OPDemoSourceInitiatorLinkViewModel >> icon [ ^ OPDemoEditorIcons initiatorLink16Icon
]
