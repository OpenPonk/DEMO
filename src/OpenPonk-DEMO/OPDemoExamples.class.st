Class {
	#name : 'OPDemoExamples',
	#superclass : 'Object',
	#category : 'OpenPonk-DEMO-Examples',
	#package : 'OpenPonk-DEMO',
	#tag : 'Examples'
}

{ #category : 'examples' }
OPDemoExamples class >> emptyModel [

	<script: 'self emptyModel inspect'>
	^ OPDemo new
		  name: 'New DEMO diagram';
		  yourself
]

{ #category : 'examples' }
OPDemoExamples class >> exampleCarRental [

	<script: 'self exampleCarRental inspect'>
	| demo scopeOfInterest rentalCompleter renter transactionA executorLinkA initiatorLinkA|
	demo := OPDemo named: 'Car Rental'.
	scopeOfInterest := OPDemoScopeOfInterest named: 'RAC branch'.
	rentalCompleter := OPDemoInternalActor named: 'A1'.
	rentalCompleter labelActor: 'rental completer'.
	renter := OPDemoCompositeActor named: 'CA1'.
	renter labelActor: 'renter'.
	transactionA := OPDemoStandardInternalTransaction named: 'T1'.
	executorLinkA := OPDemoSourceInitiatorLink from: rentalCompleter to: transactionA.
	initiatorLinkA := OPDemoTargetInitiatorLink from: transactionA to: renter.
	"rentalCompleterLocation := RSLocation new
													center.
	rentalCompleterLocation stick: rentalCompleter on: (scopeOfInterest roassalShapes)."
	demo
		add: scopeOfInterest;
		add: renter;
		add: transactionA.
	scopeOfInterest
		add: rentalCompleter.
	demo 
		add: executorLinkA;
		add: initiatorLinkA.
	^ demo
]

{ #category : 'examples' }
OPDemoExamples class >> menuCommandOn: aBuilder [

	<worldMenu>
	(aBuilder item: #OPDEMO)
		label: 'DEMO';
		icon: OPDemoEditorIcons demo16Icon;
		action: [ self openExampleEmptyModel ];
		parent: #MostUsedTools;
		order: 220;
		with: [  
			(aBuilder item: #'DEMO Example')
				parent: #OPDEMO;
				label: 'DEMO Example Car Rental';
				icon: OPDemoEditorIcons demo16Icon;
				action: [ self openExample ]].
]

{ #category : 'examples' }
OPDemoExamples class >> openExample [

	<example>
	self openExample: self exampleCarRental 
]

{ #category : 'examples' }
OPDemoExamples class >> openExample: aModel [

	| project |
	project := OPProject named: 'DEMO Example'.
	project addModel: aModel.
	^ (OPWorkbench openProject: project) showAllElementsInAllDiagrams
]

{ #category : 'examples' }
OPDemoExamples class >> openExampleEmptyModel [

	<example>
	self openExample: self emptyModel
]
