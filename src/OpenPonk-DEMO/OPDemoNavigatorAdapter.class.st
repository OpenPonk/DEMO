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

	^ {  (OPDemo -> #nodes).
		  "(OPDemoElement -> [ :o | o incoming , o outgoing ])."
		  "(OPFsmTransition -> #(  )) "}
]

{ #category : 'widget API' }
OPDemoNavigatorAdapter >> displayMapping [

	^ {  (OPDemo -> 'Diagram').
		  (OPDemoScopeOfInterest -> 'Scope of interest').
		  "(OPDemoActor -> [ :o |
		   o isComposite
			   ifTrue: [ 'Composite Actor' ]
			   ifFalse: [ 'Internal Actor' ] ])."
		  (OPDemoCompositeActor -> 'Composite Actor').
		  (OPDemoInternalActor -> 'Internal Actor').
		  (OPDemoMultipleInternalTransaction -> 'Multiple Internal Transaction').
		  (OPDemoStandardInternalTransaction -> 'Standard Internal Transaction').
		  (OPDemoMultipleCompositeTransaction -> 'Multiple Composite Transaction').
		  (OPDemoStandardCompositeTransaction -> 'Standard Composite Transaction').
		  (OPDemoLink -> [ :o |
		   o isWaiting 
			   ifTrue: [ 'Waiting Link' ]
			   ifFalse: [ 
				o isAccess 
					ifTrue: ['Access Link' ]
					ifFalse: 'Initiator Link' ] ])}
]

{ #category : 'widget API' }
OPDemoNavigatorAdapter >> hasMappingFor: anObject in: aModel [

	^ {  OPDemo.
		  "OPDemoElement."
		  OPDemoElement } anySatisfy: [ :any | anObject isKindOf: any ]
]

{ #category : 'widget API' }
OPDemoNavigatorAdapter >> iconMapping [

	^ {  (OPDemo -> OPDemoEditorIcons demo16Icon ).
		  (OPDemoScopeOfInterest -> OPDemoEditorIcons scopeOfInterest16Icon ).
		  (OPDemoLink -> [ :o |
		   o isInitiator
			   ifTrue: [ OPDemoEditorIcons initiatorLink16Icon ]
			   ifFalse: [
					o isWaiting 
						ifTrue: [ OPDemoEditorIcons waitingLink16Icon ]
						ifFalse: [ OPDemoEditorIcons accessLink16Icon ] ]
						] ).
		  "(OPDemoActor -> [ :o |
		   o isComposite
			   ifTrue: [ OPDemoEditorIcons compositeActor16Icon ]
			   ifFalse: [ OPDemoEditorIcons actor16Icon ] ])."
		  (OPDemoCompositeActor -> OPDemoEditorIcons compositeActor16Icon ).
		  (OPDemoInternalActor -> OPDemoEditorIcons actor16Icon ).
		  (OPDemoStandardInternalTransaction -> OPDemoEditorIcons transaction16Icon ).
		  (OPDemoStandardCompositeTransaction -> OPDemoEditorIcons compositeTransaction16Icon ).
		  (OPDemoMultipleInternalTransaction -> OPDemoEditorIcons multipleTransaction16Icon ).
		  (OPDemoMultipleCompositeTransaction -> OPDemoEditorIcons multipleCompositeTransaction16Icon )}
]

{ #category : 'widget API' }
OPDemoNavigatorAdapter >> typesByDependency [

	^ {  OPDemo.
		  OPDemoElement.
		  OPDemoLink }
]
