"
I implement specific mappings for DEMO.

This class primarily serves to map elements for the navigator
"
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
	^ {	  (OPDemo -> #nodes).
		  (OPDemoElement -> [ :o | o incoming , o outgoing ]).
		  (OPDemoScopeOfInterest -> [ :o | o nodes , o edges ]).
		  (OPDemoActor -> [ :actor | actor transactions , actor incoming , actor outgoing ]).
		}
]

{ #category : 'widget API' }
OPDemoNavigatorAdapter >> displayMapping [

	^ {  (OPDemo -> 'Diagram').
		  (OPDemoScopeOfInterest -> 'Scope of Interest').
		  (OPDemoCompositeActor -> 'Composite Actor Role').
		  (OPDemoInternalActor -> 'Internal Actor Role').
		  (OPDemoMultipleInternalTransaction -> 'Multiple Internal Transaction').
		  (OPDemoStandardInternalTransaction -> 'Standard Internal Transaction').
		  (OPDemoMultipleCompositeTransaction -> 'Multiple Composite Transaction').
		  (OPDemoStandardCompositeTransaction -> 'Standard Composite Transaction').
		  (OPDemoAccessLink -> 'Access Link').
		  (OPDemoSourceInitiatorLink -> 'Executor Link').
		  (OPDemoTargetInitiatorLink -> 'Initiator Link').
		  (OPDemoWaitingLink -> 'Waiting Link').
		  (OPDemoFacts -> 'Fact Bank').}
]

{ #category : 'widget API' }
OPDemoNavigatorAdapter >> hasMappingFor: anObject in: aModel [

	^ {  OPDemo.
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
