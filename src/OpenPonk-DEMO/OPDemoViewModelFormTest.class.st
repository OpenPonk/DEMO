Class {
	#name : 'OPDemoViewModelFormTest',
	#superclass : 'TestCase',
	#instVars : [
		'undoManager',
		'form'
	],
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'running' }
OPDemoViewModelFormTest >> setUp [
	"Prepare isolated test fixture with dedicated undo manager and form."
	super setUp.
	undoManager := OPUndoManager new.
	form := OPPropertiesForm new.
	form undoManager: undoManager
]

{ #category : 'running' }
OPDemoViewModelFormTest >> tearDown [
	"Clean up isolated test fixtures."
	form := nil.
	undoManager := nil.
	super tearDown
]

{ #category : 'tests' }
OPDemoViewModelFormTest >> testFactsViewModelFormBindingAndUndo [
	"Verify declarative bindings for ID and Facts Label on Facts ViewModel."
	| model viewModel labelBinding |
	model := OPDemoFacts new name: 'F1'; labelFacts: 'Initial Fact'.
	viewModel := OPDemoFactsViewModel new model: model.
	form viewModel: viewModel.

	self assert: (form bindings anySatisfy: [ :each | each selector = #name ]).
	self assert: (form bindings anySatisfy: [ :each | each selector = #labelFacts ]).

	labelBinding := form bindings detect: [ :each | each selector = #labelFacts ].
	labelBinding writeModelValue: 'Updated Fact'.
	self assert: model labelFacts equals: 'Updated Fact'.

	undoManager undo.
	self assert: model labelFacts equals: 'Initial Fact'
]

{ #category : 'tests' }
OPDemoViewModelFormTest >> testInternalActorViewModelFormBindingAndUndo [
	"Verify declarative bindings for ID and Actor Label on Internal Actor ViewModel."
	| model viewModel nameBinding labelBinding |
	model := OPDemoInternalActor new name: 'A1'; labelActor: 'Customer'.
	viewModel := OPDemoInternalActorViewModel new model: model.
	form viewModel: viewModel.

	self assert: (form bindings anySatisfy: [ :each | each selector = #name ]).
	self assert: (form bindings anySatisfy: [ :each | each selector = #labelActor ]).

	nameBinding := form bindings detect: [ :each | each selector = #name ].
	labelBinding := form bindings detect: [ :each | each selector = #labelActor ].

	nameBinding writeModelValue: 'A2'.
	labelBinding writeModelValue: 'Supplier'.
	self assert: model name equals: 'A2'.
	self assert: model labelActor equals: 'Supplier'.

	undoManager undo.
	self assert: model labelActor equals: 'Customer'.
	undoManager undo.
	self assert: model name equals: 'A1'
]

{ #category : 'tests' }
OPDemoViewModelFormTest >> testScopeOfInterestViewModelFormBindingAndUndo [
	"Verify declarative binding for Name on Scope of Interest ViewModel."
	| model viewModel nameBinding |
	model := OPDemoScopeOfInterest new name: 'Initial Scope'.
	viewModel := OPDemoScopeOfInterestViewModel new model: model.
	form viewModel: viewModel.

	self assert: (form bindings anySatisfy: [ :each | each selector = #name ]).
	nameBinding := form bindings detect: [ :each | each selector = #name ].
	nameBinding writeModelValue: 'Expanded Scope'.
	self assert: model name equals: 'Expanded Scope'.

	undoManager undo.
	self assert: model name equals: 'Initial Scope'
]

{ #category : 'tests' }
OPDemoViewModelFormTest >> testStandardInternalTransactionViewModelFormBindingAndUndo [
	"Verify declarative bindings for ID, Type, and Product Kind on Transaction ViewModel."
	| model viewModel nameBinding typeBinding productBinding |
	model := OPDemoStandardInternalTransaction new
		name: 'T1';
		type: 'Ontological';
		productKind: 'Car'.
	viewModel := OPDemoStandardInternalTransactionViewModel new model: model.
	form viewModel: viewModel.

	self assert: (form bindings anySatisfy: [ :each | each selector = #name ]).
	self assert: (form bindings anySatisfy: [ :each | each selector = #type ]).
	self assert: (form bindings anySatisfy: [ :each | each selector = #productKind ]).

	nameBinding := form bindings detect: [ :each | each selector = #name ].
	typeBinding := form bindings detect: [ :each | each selector = #type ].
	productBinding := form bindings detect: [ :each | each selector = #productKind ].

	nameBinding writeModelValue: 'T2'.
	typeBinding writeModelValue: 'Informational'.
	productBinding writeModelValue: 'Document'.
	self assert: model name equals: 'T2'.
	self assert: model type equals: 'Informational'.
	self assert: model productKind equals: 'Document'.

	undoManager undo.
	self assert: model productKind equals: 'Car'.
	undoManager undo.
	self assert: model type equals: 'Ontological'.
	undoManager undo.
	self assert: model name equals: 'T1'
]
