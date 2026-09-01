"
View model for DEMO waiting links.
Handles model attachment logic between a waiting actor and a transaction, and provides icons for the UI layer.
"
Class {
	#name : 'OPDemoWaitingLinkViewModel',
	#superclass : 'OPDemoLinkViewModel',
	#category : 'OpenPonk-DEMO-ViewModels',
	#package : 'OpenPonk-DEMO',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPDemoWaitingLinkViewModel class >> modelClass [ ^ OPDemoWaitingLink
]

{ #category : 'construction' }
OPDemoWaitingLinkViewModel >> attachModelFrom: sourceViewModel to: targetViewModel [
	self model source: sourceViewModel model.
	self model target: targetViewModel model.
]

{ #category : 'accessing' }
OPDemoWaitingLinkViewModel >> icon [ ^ OPDemoEditorIcons waitingLink16Icon
]
