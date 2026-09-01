"
View model for DEMO multiple composite transactions.
Provides icons and form building specifications to the workbench without GUI dependencies.
"
Class {
	#name : 'OPDemoMultipleCompositeTransactionViewModel',
	#superclass : 'OPDemoTransactionViewModel',
	#category : 'OpenPonk-DEMO-ViewModels',
	#package : 'OpenPonk-DEMO',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPDemoMultipleCompositeTransactionViewModel class >> modelClass [ ^ OPDemoMultipleCompositeTransaction
]

{ #category : 'accessing' }
OPDemoMultipleCompositeTransactionViewModel >> icon [ ^ OPDemoEditorIcons multipleCompositeTransaction16Icon
]
