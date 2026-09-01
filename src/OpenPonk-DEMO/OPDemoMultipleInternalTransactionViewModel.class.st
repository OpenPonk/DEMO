"
View model for DEMO multiple internal transactions.
Provides icons and form building specifications to the workbench without GUI dependencies.
"
Class {
	#name : 'OPDemoMultipleInternalTransactionViewModel',
	#superclass : 'OPDemoTransactionViewModel',
	#category : 'OpenPonk-DEMO-ViewModels',
	#package : 'OpenPonk-DEMO',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPDemoMultipleInternalTransactionViewModel class >> modelClass [ ^ OPDemoMultipleInternalTransaction
]

{ #category : 'accessing' }
OPDemoMultipleInternalTransactionViewModel >> icon [ ^ OPDemoEditorIcons multipleTransaction16Icon
]
