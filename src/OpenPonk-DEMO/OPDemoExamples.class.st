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
	| 	executorLinkA initiatorLinkA
		demo scopeOfInterest
		renter payer driver driver2 rentalConcluder transporter transportManager carIssuer
		transaction1 transaction2 transaction3 transaction4 transaction5 transaction6 transaction7
		facts1 facts2 facts3
	|
	demo := OPDemo named: 'Car Rental Example'.
	scopeOfInterest := OPDemoScopeOfInterest named: 'RAC branch'.
	rentalConcluder := OPDemoInternalActor named: 'A1'.
	rentalConcluder labelActor: 'rental concluder'.
	transporter := OPDemoInternalActor named: 'A6'.
	transporter labelActor: 'transporter'.
	transportManager := OPDemoInternalActor named: 'A2'.
	transportManager labelActor: 'transport manager'.
	carIssuer := OPDemoInternalActor named: 'A3'.
	carIssuer labelActor: 'car issuer'.	
	renter := OPDemoCompositeActor named: 'CA1'.
	renter labelActor: 'renter'.
	payer := OPDemoCompositeActor named: 'CA4'.
	payer labelActor: 'payer'.
	driver := OPDemoCompositeActor named: 'CA2'.
	driver labelActor: 'driver'.
	driver2 := OPDemoCompositeActor named: 'CA3'.
	driver2 labelActor: 'driver'.	
	transaction1 := OPDemoStandardInternalTransaction named: 'T1'.
	transaction2 := OPDemoStandardInternalTransaction named: 'T2'.
	transaction3 := OPDemoStandardInternalTransaction named: 'T3'.
	transaction4 := OPDemoStandardInternalTransaction named: 'T4'.
	transaction5 := OPDemoStandardInternalTransaction named: 'T5'.
	transaction6 := OPDemoStandardInternalTransaction named: 'T6'.
	transaction7 := OPDemoStandardInternalTransaction named: 'T7'.
	
	executorLinkA := OPDemoSourceInitiatorLink from: rentalConcluder to: transaction1.
	initiatorLinkA := OPDemoTargetInitiatorLink from: transaction1 to: renter.
	
	demo
		add: scopeOfInterest;
		add: renter;
		add: payer;
		add: driver;
		add: driver2.
	scopeOfInterest
		add: rentalConcluder;
		add: transporter;
		add: transportManager;
		add: carIssuer;
		add: transaction1;
		add: transaction2;
		add: transaction3;
		add: transaction4;
		add: transaction5;
		add: transaction6;
		add: transaction7.
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
