"
View model for DEMO internal Actor Roles.
Provides icons and form building specifications to the workbench and UI layers without direct GUI dependencies.
"
Class {
	#name : 'OPDemoInternalActorViewModel',
	#superclass : 'OPDemoActorViewModel',
	#category : 'OpenPonk-DEMO-ViewModels',
	#package : 'OpenPonk-DEMO',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPDemoInternalActorViewModel class >> modelClass [ ^ OPDemoInternalActor
]

{ #category : 'accessing' }
OPDemoInternalActorViewModel >> icon [ ^ OPDemoEditorIcons actor16Icon
]
