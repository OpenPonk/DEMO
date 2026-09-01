"
View model for the top-level DEMO CSD model. Provides essential child models and icon definitions for the workbench tree and form integrations.
"
Class {
	#name : 'OPDemoViewModel',
	#superclass : 'OPModelObjectViewModel',
	#category : 'OpenPonk-DEMO-ViewModels',
	#package : 'OpenPonk-DEMO',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPDemoViewModel class >> commonModelClassPrefix [

	^ 'OPDemo'
]

{ #category : 'accessing' }
OPDemoViewModel class >> modelClass [ ^ OPDemo
]

{ #category : 'accessing' }
OPDemoViewModel >> childrenModels [ ^ self model nodes
]

{ #category : 'accessing' }
OPDemoViewModel >> essentialChildrenModels [
			^ self model elements asArray
]

{ #category : 'accessing' }
OPDemoViewModel >> icon [ ^ OPDemoEditorIcons demo16Icon
]

{ #category : 'accessing' }
OPDemoViewModel >> modelRootViewModel [

	^ self
]
