"
Controller for DEMO Fact Bank elements.
Manages diagram interactions, validates connections, and synchronizes the Fact Bank model with the view.
"
Class {
	#name : 'OPDemoFactsController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoFactsController class >> diagramElementClass [

	^ OPDemoFactsShape 
]

{ #category : 'accessing' }
OPDemoFactsController class >> viewModelClass [
	^ OPDemoFactsViewModel
]
