"
View model for DEMO standard composite transactions.
Provides icons and form building specifications to the workbench without GUI dependencies.
"
Class {
	#name : 'OPDemoStandardCompositeTransactionViewModel',
	#superclass : 'OPDemoTransactionViewModel',
	#category : 'OpenPonk-DEMO-ViewModels',
	#package : 'OpenPonk-DEMO',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPDemoStandardCompositeTransactionViewModel class >> modelClass [ ^ OPDemoStandardCompositeTransaction
]

{ #category : 'accessing' }
OPDemoStandardCompositeTransactionViewModel >> icon [ ^ OPDemoEditorIcons compositeTransaction16Icon
]
