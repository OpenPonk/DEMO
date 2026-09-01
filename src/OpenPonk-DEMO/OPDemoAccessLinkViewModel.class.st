"
View model for DEMO access links.
Handles model attachment logic between source and target elements and provides icons for the UI.
"
Class {
	#name : 'OPDemoAccessLinkViewModel',
	#superclass : 'OPDemoLinkViewModel',
	#category : 'OpenPonk-DEMO-ViewModels',
	#package : 'OpenPonk-DEMO',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPDemoAccessLinkViewModel class >> modelClass [ ^ OPDemoAccessLink
]

{ #category : 'construction' }
OPDemoAccessLinkViewModel >> attachModelFrom: sourceViewModel to: targetViewModel [
	self model source: sourceViewModel model.
	self model target: targetViewModel model.
]

{ #category : 'accessing' }
OPDemoAccessLinkViewModel >> icon [ ^ OPDemoEditorIcons accessLink16Icon
]
