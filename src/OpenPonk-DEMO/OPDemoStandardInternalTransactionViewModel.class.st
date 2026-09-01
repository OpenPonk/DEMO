"
View model for DEMO standard internal transactions.
Provides icons and form building specifications to the workbench without GUI dependencies.
"
Class {
	#name : 'OPDemoStandardInternalTransactionViewModel',
	#superclass : 'OPDemoTransactionViewModel',
	#category : 'OpenPonk-DEMO-ViewModels',
	#package : 'OpenPonk-DEMO',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPDemoStandardInternalTransactionViewModel class >> modelClass [ ^ OPDemoStandardInternalTransaction
]

{ #category : 'accessing' }
OPDemoStandardInternalTransactionViewModel >> icon [ ^ OPDemoEditorIcons transaction16Icon
]
