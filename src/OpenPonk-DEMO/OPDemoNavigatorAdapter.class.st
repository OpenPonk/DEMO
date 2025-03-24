Class {
	#name : 'OPDemoNavigatorAdapter',
	#superclass : 'OPNavigatorAdapter',
	#category : 'OpenPonk-DEMO-Adapters',
	#package : 'OpenPonk-DEMO',
	#tag : 'Adapters'
}

{ #category : 'accessing' }
OPDemoNavigatorAdapter class >> priority [

	^ 10
]

{ #category : 'widget API' }
OPDemoNavigatorAdapter >> childrenMapping [
	|actorElements|
	actorElements := (OPDemoActor -> #transactions).
	^ {	  (OPDemo -> #nodes).
		  (OPDemoElement -> [ :o | o incoming , o outgoing ]).
		  (OPDemoScopeOfInterest -> #nodes).}
]

{ #category : 'widget API' }
OPDemoNavigatorAdapter >> displayMapping [

	^ {  (OPDemo -> 'Diagram').
		  (OPDemoScopeOfInterest -> 'Scope of interest').
		  (OPDemoCompositeActor -> 'Composite Actor').
		  (OPDemoInternalActor -> 'Internal Actor').
		  (OPDemoMultipleInternalTransaction -> 'Multiple Internal Transaction').
		  (OPDemoStandardInternalTransaction -> 'Standard Internal Transaction').
		  (OPDemoMultipleCompositeTransaction -> 'Multiple Composite Transaction').
		  (OPDemoStandardCompositeTransaction -> 'Standard Composite Transaction').
		  (OPDemoAccessLink -> 'Access Link').
		  (OPDemoSourceInitiatorLink -> 'Source Initiator Link').
		  (OPDemoTargetInitiatorLink -> 'Target Initiator Link').
		  (OPDemoWaitingLink -> 'Waiting Link').
		  (OPDemoFacts -> 'Facts').}
]

{ #category : 'widget API' }
OPDemoNavigatorAdapter >> hasMappingFor: anObject in: aModel [

	^ {  OPDemo.
		  "OPDemoElement."
		  OPDemoLink.
		  OPDemoElement } anySatisfy: [ :any | anObject isKindOf: any ]
]

{ #category : 'widget API' }
OPDemoNavigatorAdapter >> iconMapping [

	^ {  (OPDemo -> OPDemoEditorIcons demo16Icon ).
		  (OPDemoScopeOfInterest -> OPDemoEditorIcons scopeOfInterest16Icon ).
		  (OPDemoAccessLink -> OPDemoEditorIcons accessLink16Icon ).
		  (OPDemoTargetInitiatorLink -> OPDemoEditorIcons initiatorLinkTarget16Icon ).
		  (OPDemoSourceInitiatorLink -> OPDemoEditorIcons initiatorLink16Icon ).
		  (OPDemoWaitingLink -> OPDemoEditorIcons waitingLink16Icon ).
		  (OPDemoCompositeActor -> OPDemoEditorIcons compositeActor16Icon ).
		  (OPDemoInternalActor -> OPDemoEditorIcons actor16Icon ).
		  (OPDemoStandardInternalTransaction -> OPDemoEditorIcons transaction16Icon ).
		  (OPDemoStandardCompositeTransaction -> OPDemoEditorIcons compositeTransaction16Icon ).
		  (OPDemoMultipleInternalTransaction -> OPDemoEditorIcons multipleTransaction16Icon ).
		  (OPDemoMultipleCompositeTransaction -> OPDemoEditorIcons multipleCompositeTransaction16Icon ).
		  (OPDemoFacts -> OPDemoEditorIcons facts16Icon )}
]

{ #category : 'widget API' }
OPDemoNavigatorAdapter >> typesByDependency [

	^ {  OPDemo.
		  OPDemoElement.
		  OPDemoLink }
]
