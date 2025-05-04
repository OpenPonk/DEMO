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
	| 	executorLink1 executorLink2 executorLink3 executorLink4 executorLink5 executorLink6
		initiatorLink1 initiatorLink2 initiatorLink3 initiatorLink4 initiatorLink5 initiatorLink6
		accessLink1 accessLink2 accessLink3
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
	
	facts1 := OPDemoFacts named: 'AT1'.
	facts1 labelFacts: 'persons facts'.
	facts2 := OPDemoFacts named: 'AT2'.
	facts2 labelFacts: 'RAC facts'.
	facts3 := OPDemoFacts named: 'AT3'.
	facts3 labelFacts: 'operational facts other branches'.
	
	executorLink1 := OPDemoSourceInitiatorLink from: rentalConcluder to: transaction1.
	executorLink2 := OPDemoSourceInitiatorLink from: payer to: transaction2.
	executorLink3 := OPDemoSourceInitiatorLink from: transporter to: transaction6.
	executorLink4 := OPDemoSourceInitiatorLink from: carIssuer to: transaction3.
	executorLink5 := OPDemoSourceInitiatorLink from: driver to: transaction4.
	executorLink6 := OPDemoSourceInitiatorLink from: driver2 to: transaction5.
	initiatorLink1 := OPDemoTargetInitiatorLink from: transaction1 to: renter.
	initiatorLink2 := OPDemoTargetInitiatorLink from: transaction2 to: rentalConcluder.
	initiatorLink3 := OPDemoTargetInitiatorLink from: transaction6 to: transportManager.
	initiatorLink4 := OPDemoTargetInitiatorLink from: transaction3 to: driver.
	initiatorLink5 := OPDemoTargetInitiatorLink from: transaction4 to: carIssuer.
	initiatorLink6 := OPDemoTargetInitiatorLink from: transaction5 to: carIssuer.
	accessLink1 := OPDemoAccessLink from: facts1 to: scopeOfInterest.
	accessLink2 := OPDemoAccessLink from: facts2 to: scopeOfInterest.
	accessLink3 := OPDemoAccessLink from: facts3 to: scopeOfInterest.
	
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
		add: transaction6.
	transportManager
		add: transaction7.
	demo 
		add: executorLink1;
		add: executorLink2;
		add: executorLink3;
		add: executorLink4;
		add: executorLink5;
		add: executorLink6;
		add: initiatorLink1;
		add: initiatorLink2;
		add: initiatorLink3;
		add: initiatorLink4;
		add: initiatorLink5;
		add: initiatorLink6;
		add: facts1;
		add: facts2;
		add: facts3;
		add: accessLink1;
		add: accessLink2;
		add: accessLink3.
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
