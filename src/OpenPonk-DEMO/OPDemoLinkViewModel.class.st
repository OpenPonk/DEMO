"
Abstract view model for DEMO diagram edges (links).
Provides model attachment domain logic and form building structures to the workbench without GUI dependencies.
"
Class {
	#name : 'OPDemoLinkViewModel',
	#superclass : 'OPDirectedAssociationViewModel',
	#category : 'OpenPonk-DEMO-ViewModels',
	#package : 'OpenPonk-DEMO',
	#tag : 'ViewModels'
}

{ #category : 'testing' }
OPDemoLinkViewModel class >> isAbstract [

	^ self = OPDemoLinkViewModel
]

{ #category : 'accessing' }
OPDemoLinkViewModel class >> modelClass [ ^ OPDemoLink
]
