"
View model for DEMO composite Actor Roles.
Provides icons, form building specifications, and internal element hierarchy mappings to the workbench and UI layers.
"
Class {
	#name : 'OPDemoCompositeActorViewModel',
	#superclass : 'OPDemoActorViewModel',
	#category : 'OpenPonk-DEMO-ViewModels',
	#package : 'OpenPonk-DEMO',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPDemoCompositeActorViewModel class >> modelClass [ ^ OPDemoCompositeActor
]

{ #category : 'accessing' }
OPDemoCompositeActorViewModel >> icon [ ^ OPDemoEditorIcons compositeActor16Icon
]
