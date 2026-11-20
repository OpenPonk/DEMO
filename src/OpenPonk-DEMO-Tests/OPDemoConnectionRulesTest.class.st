"
Unit tests for DEMO controller connection rules, validating source and target eligibility across actors, transactions, scopes of interest, and link controllers.
"
Class {
	#name : 'OPDemoConnectionRulesTest',
	#superclass : 'TestCase',
	#instVars : [
		'demoModel',
		'project',
		'projectController',
		'diagramController'
	],
	#category : 'OpenPonk-DEMO-Tests-Controllers',
	#package : 'OpenPonk-DEMO-Tests',
	#tag : 'Controllers'
}

{ #category : 'private' }
OPDemoConnectionRulesTest >> newControllerOf: aControllerClass forModel: aModel [

	^ aControllerClass new
		  diagramController: diagramController;
		  model: aModel;
		  yourself
]

{ #category : 'running' }
OPDemoConnectionRulesTest >> setUp [

	super setUp.
	demoModel := OPDemo named: 'Demo'.
	project := OPProject named: 'Test Project'.
	project addModel: demoModel.
	projectController := OPProjectController forProject: project.
	diagramController := OPDemoController new.
	projectController addDiagramController: diagramController.
	diagramController
		canvasPresenter: OPHeadlessCanvasPresenter new;
		diagramElement: (OPOpenPonkDiagram forModelElement: demoModel);
		model: demoModel
]

{ #category : 'running' }
OPDemoConnectionRulesTest >> tearDown [

	diagramController := nil.
	projectController := nil.
	project := nil.
	demoModel := nil.
	super tearDown
]

{ #category : 'tests' }
OPDemoConnectionRulesTest >> testActorControllerCanBeSourceFor [

	| actor transaction actorController existingLink |
	actor := OPDemoInternalActor named: 'A1'.
	transaction := OPDemoStandardInternalTransaction named: 'T1'.
	demoModel add: actor.
	demoModel add: transaction.
	actorController := self newControllerOf: OPDemoInternalActorController forModel: actor.

	self
		assert: (actorController canBeSourceFor: OPDemoAccessLinkController new)
		description: 'Actor must accept access link as source'.
	self
		assert: (actorController canBeSourceFor: OPDemoWaitingLinkController new)
		description: 'Actor must accept waiting link as source'.
	self
		assert: (actorController canBeSourceFor: OPDemoTargetInitiatorLinkController new)
		description: 'Actor must accept target initiator link as source'.
	self
		assert: (actorController canBeSourceFor: OPDemoSourceInitiatorLinkController new)
		description: 'Actor without child transaction or executor link must accept source initiator link'.
	self
		deny: (actorController canBeSourceFor: OPDemoInternalActorController new)
		description: 'Actor must reject non-link controller as source'.

	existingLink := OPDemoSourceInitiatorLink from: actor to: transaction.
	demoModel add: existingLink.
	self
		deny: (actorController canBeSourceFor: OPDemoSourceInitiatorLinkController new)
		description: 'Actor with existing source initiator link must reject another source initiator link'.
	existingLink remove.

	actor add: transaction.
	self
		deny: (actorController canBeSourceFor: OPDemoSourceInitiatorLinkController new)
		description: 'Actor owning a transaction must reject source initiator link as source'.
	self
		assert: (actorController canBeSourceFor: OPDemoAccessLinkController new)
		description: 'Actor owning a transaction must still accept access link as source'
]

{ #category : 'tests' }
OPDemoConnectionRulesTest >> testActorControllerCanBeTargetFor [

	| actor transaction actorController transactionController waitingFromTransaction waitingFromActor targetInitiatorFromTransaction targetInitiatorFromActor sourceInitiatorFromTransaction sourceInitiatorFromActor |
	actor := OPDemoInternalActor named: 'A1'.
	transaction := OPDemoStandardInternalTransaction named: 'T1'.
	demoModel add: actor.
	demoModel add: transaction.
	actorController := self newControllerOf: OPDemoInternalActorController forModel: actor.
	transactionController := self newControllerOf: OPDemoStandardInternalTransactionController forModel: transaction.

	self
		assert: (actorController canBeTargetFor: OPDemoStandardInternalTransactionController new)
		description: 'Empty actor must accept a standard internal transaction'.
	self
		assert: (actorController canBeTargetFor: OPDemoAccessLinkController new)
		description: 'Actor must accept access link as target'.
	self
		deny: (actorController canBeTargetFor: OPDemoCompositeActorController new)
		description: 'Actor must reject composite actor controller as target'.

	waitingFromTransaction := OPDemoWaitingLinkController new
		                          source: transactionController;
		                          yourself.
	waitingFromActor := OPDemoWaitingLinkController new
		                    source: actorController;
		                    yourself.
	self
		assert: (actorController canBeTargetFor: waitingFromTransaction)
		description: 'Actor must accept waiting link originating from a transaction'.
	self
		deny: (actorController canBeTargetFor: waitingFromActor)
		description: 'Actor must reject waiting link originating from an actor'.

	targetInitiatorFromTransaction := OPDemoTargetInitiatorLinkController new
		                                  source: transactionController;
		                                  yourself.
	targetInitiatorFromActor := OPDemoTargetInitiatorLinkController new
		                            source: actorController;
		                            yourself.
	self
		assert: (actorController canBeTargetFor: targetInitiatorFromTransaction)
		description: 'Actor must accept target initiator link originating from a transaction'.
	self
		deny: (actorController canBeTargetFor: targetInitiatorFromActor)
		description: 'Actor must reject target initiator link originating from an actor'.

	sourceInitiatorFromTransaction := OPDemoSourceInitiatorLinkController new
		                                  source: transactionController;
		                                  yourself.
	sourceInitiatorFromActor := OPDemoSourceInitiatorLinkController new
		                            source: actorController;
		                            yourself.
	self
		assert: (actorController canBeTargetFor: sourceInitiatorFromTransaction)
		description: 'Actor must accept source initiator link originating from a transaction'.
	self
		deny: (actorController canBeTargetFor: sourceInitiatorFromActor)
		description: 'Actor must reject source initiator link originating from an actor'.

	actor add: transaction.
	self
		deny: (actorController canBeTargetFor: OPDemoStandardInternalTransactionController new)
		description: 'Actor already owning a transaction must reject another standard internal transaction'
]

{ #category : 'tests' }
OPDemoConnectionRulesTest >> testLinkControllerIsAbstract [

	self assert: OPDemoLinkController isAbstract description: 'OPDemoLinkController base class must be abstract'.
	self deny: OPDemoAccessLinkController isAbstract description: 'Concrete link controller subclass must not be abstract'
]

{ #category : 'tests' }
OPDemoConnectionRulesTest >> testScopeOfInterestControllerCanBeSourceAndTargetFor [

	| scope scopeController |
	scope := OPDemoScopeOfInterest named: 'Scope'.
	demoModel add: scope.
	scopeController := self newControllerOf: OPDemoScopeOfInterestController forModel: scope.

	self
		assert: (scopeController canBeSourceFor: OPDemoAccessLinkController new)
		description: 'Scope of interest must accept access link as source'.
	self
		deny: (scopeController canBeSourceFor: OPDemoWaitingLinkController new)
		description: 'Scope of interest must reject waiting link as source'.

	self
		deny: (scopeController canBeTargetFor: OPDemoScopeOfInterestController new)
		description: 'Scope of interest must reject another scope of interest as target'.
	self
		assert: (scopeController canBeTargetFor: OPDemoInternalActorController new)
		description: 'Scope of interest must accept element controllers as target'.
	self
		assert: (scopeController canBeTargetFor: OPDemoAccessLinkController new)
		description: 'Scope of interest must accept access link as target'.
	self
		deny: (scopeController canBeTargetFor: OPDemoWaitingLinkController new)
		description: 'Scope of interest must reject non-access link controllers as target'
]

{ #category : 'tests' }
OPDemoConnectionRulesTest >> testTransactionControllerCanBeSourceAndTargetFor [

	| actor transaction transactionController actorController targetInitiatorFromActor targetInitiatorFromTransaction sourceInitiatorFromActor sourceInitiatorFromTransaction |
	actor := OPDemoInternalActor named: 'A1'.
	transaction := OPDemoStandardInternalTransaction named: 'T1'.
	demoModel add: actor.
	demoModel add: transaction.
	actorController := self newControllerOf: OPDemoInternalActorController forModel: actor.
	transactionController := self newControllerOf: OPDemoStandardInternalTransactionController forModel: transaction.

	self
		assert: (transactionController canBeSourceFor: OPDemoAccessLinkController new)
		description: 'Standalone transaction must accept access link as source'.
	self
		assert: (transactionController canBeSourceFor: OPDemoWaitingLinkController new)
		description: 'Standalone transaction must accept waiting link as source'.
	self
		assert: (transactionController canBeSourceFor: OPDemoTargetInitiatorLinkController new)
		description: 'Standalone transaction must accept target initiator link as source'.
	self
		assert: (transactionController canBeSourceFor: OPDemoSourceInitiatorLinkController new)
		description: 'Standalone transaction must accept source initiator link as source'.
	self
		deny: (transactionController canBeSourceFor: OPDemoInternalActorController new)
		description: 'Transaction must reject non-link controller as source'.

	self
		assert: (transactionController canBeTargetFor: OPDemoAccessLinkController new)
		description: 'Standalone transaction must accept access link as target'.
	self
		assert: (transactionController canBeTargetFor: OPDemoWaitingLinkController new)
		description: 'Standalone transaction must accept waiting link as target'.
	self
		deny: (transactionController canBeTargetFor: OPDemoInternalActorController new)
		description: 'Transaction must reject non-link controller as target'.

	targetInitiatorFromActor := OPDemoTargetInitiatorLinkController new
		                            source: actorController;
		                            yourself.
	targetInitiatorFromTransaction := OPDemoTargetInitiatorLinkController new
		                                  source: transactionController;
		                                  yourself.
	self
		assert: (transactionController canBeTargetFor: targetInitiatorFromActor)
		description: 'Transaction must accept target initiator link from an actor'.
	self
		deny: (transactionController canBeTargetFor: targetInitiatorFromTransaction)
		description: 'Transaction must reject target initiator link from a transaction'.

	sourceInitiatorFromActor := OPDemoSourceInitiatorLinkController new
		                            source: actorController;
		                            yourself.
	sourceInitiatorFromTransaction := OPDemoSourceInitiatorLinkController new
		                                  source: transactionController;
		                                  yourself.
	self
		assert: (transactionController canBeTargetFor: sourceInitiatorFromActor)
		description: 'Transaction must accept source initiator link from an actor'.
	self
		deny: (transactionController canBeTargetFor: sourceInitiatorFromTransaction)
		description: 'Transaction must reject source initiator link from a transaction'.

	actor add: transaction.
	self
		deny: (transactionController canBeSourceFor: OPDemoAccessLinkController new)
		description: 'Transaction owned by an actor must reject links as source'.
	self
		deny: (transactionController canBeTargetFor: OPDemoAccessLinkController new)
		description: 'Transaction owned by an actor must reject links as target'
]
