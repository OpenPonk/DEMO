"
Unit tests for DEMO view models, covering icon accessors, model class mappings, essential child discovery, and safe domain removal of actors containing transactions.
"
Class {
	#name : 'OPDemoViewModelTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-DEMO-Tests-ViewModels',
	#package : 'OpenPonk-DEMO-Tests',
	#tag : 'ViewModels'
}

{ #category : 'tests' }
OPDemoViewModelTest >> testAbstractViewModelModelClasses [

	self assert: OPDemoElementViewModel modelClass identicalTo: OPDemoElement.
	self assert: OPDemoActorViewModel modelClass identicalTo: OPDemoActor.
	self assert: OPDemoTransactionViewModel modelClass identicalTo: OPDemoTransaction.
	self assert: OPDemoLinkViewModel modelClass identicalTo: OPDemoLink
]

{ #category : 'tests' }
OPDemoViewModelTest >> testAbstractViewModelsReportIsAbstract [

	self assert: OPDemoElementViewModel isAbstract description: 'OPDemoElementViewModel must be abstract'.
	self assert: OPDemoActorViewModel isAbstract description: 'OPDemoActorViewModel must be abstract'.
	self assert: OPDemoTransactionViewModel isAbstract description: 'OPDemoTransactionViewModel must be abstract'.
	self assert: OPDemoLinkViewModel isAbstract description: 'OPDemoLinkViewModel must be abstract'.
	self deny: OPDemoInternalActorViewModel isAbstract description: 'Concrete actor view model must not be abstract'.
	self deny: OPDemoAccessLinkViewModel isAbstract description: 'Concrete link view model must not be abstract'
]

{ #category : 'tests' }
OPDemoViewModelTest >> testActorBasicRemoveModelWithChildTransactionRemovesActorFromOwner [

	| demoModel actor transaction actorViewModel |
	demoModel := OPDemo named: 'Demo'.
	actor := OPDemoInternalActor named: 'A1'.
	transaction := OPDemoStandardInternalTransaction named: 'T1'.
	demoModel add: actor.
	actor add: transaction.
	actorViewModel := OPDemoInternalActorViewModel new model: actor.

	actorViewModel basicRemoveModel.

	self assertEmpty: demoModel elements.
	self assert: actor owner identicalTo: nil
]

{ #category : 'tests' }
OPDemoViewModelTest >> testActorRemoveModelRemovesChildTransactionAndActor [

	| demoModel actor transaction project projectController actorViewModel |
	demoModel := OPDemo named: 'Demo'.
	actor := OPDemoInternalActor named: 'A1'.
	transaction := OPDemoStandardInternalTransaction named: 'T1'.
	demoModel add: actor.
	actor add: transaction.
	project := OPProject named: 'Test Project'.
	project addModel: demoModel.
	projectController := OPProjectController forProject: project.
	actorViewModel := projectController viewModelRegistry viewModelFor: actor.

	actorViewModel removeModel.

	self assertEmpty: demoModel elements.
	self assertEmpty: actor elements.
	self assert: actor owner identicalTo: nil.
	self assert: transaction owner identicalTo: nil
]

{ #category : 'tests' }
OPDemoViewModelTest >> testEssentialChildrenModels [

	| demoModel scope actor transaction demoViewModel scopeViewModel actorViewModel |
	demoModel := OPDemo named: 'Demo'.
	scope := OPDemoScopeOfInterest named: 'Scope'.
	actor := OPDemoInternalActor named: 'A1'.
	transaction := OPDemoStandardInternalTransaction named: 'T1'.
	demoModel add: scope.
	scope add: actor.
	actor add: transaction.

	demoViewModel := OPDemoViewModel new model: demoModel.
	scopeViewModel := OPDemoScopeOfInterestViewModel new model: scope.
	actorViewModel := OPDemoInternalActorViewModel new model: actor.

	self assert: demoViewModel essentialChildrenModels equals: { scope }.
	self assert: scopeViewModel essentialChildrenModels equals: { actor }.
	self assert: actorViewModel essentialChildrenModels equals: { transaction }
]

{ #category : 'tests' }
OPDemoViewModelTest >> testViewModelIcons [

	| pairs |
	pairs := {
		         (OPDemoAccessLinkViewModel -> OPDemoEditorIcons accessLink16Icon).
		         (OPDemoInternalActorViewModel -> OPDemoEditorIcons actor16Icon).
		         (OPDemoMultipleCompositeTransactionViewModel -> OPDemoEditorIcons multipleCompositeTransaction16Icon).
		         (OPDemoMultipleInternalTransactionViewModel -> OPDemoEditorIcons multipleTransaction16Icon).
		         (OPDemoSourceInitiatorLinkViewModel -> OPDemoEditorIcons initiatorLink16Icon).
		         (OPDemoStandardCompositeTransactionViewModel -> OPDemoEditorIcons compositeTransaction16Icon).
		         (OPDemoStandardInternalTransactionViewModel -> OPDemoEditorIcons transaction16Icon).
		         (OPDemoTargetInitiatorLinkViewModel -> OPDemoEditorIcons initiatorLinkTarget16Icon).
		         (OPDemoWaitingLinkViewModel -> OPDemoEditorIcons waitingLink16Icon) }.

	pairs do: [ :eachPair |
			| actualIcon expectedIcon |
			actualIcon := eachPair key new icon.
			expectedIcon := eachPair value.
			self assert: actualIcon class identicalTo: Form.
			self assert: actualIcon extent equals: expectedIcon extent.
			self assert: actualIcon bits equals: expectedIcon bits ]
]
