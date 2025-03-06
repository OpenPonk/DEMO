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
		  (OPDemoActor -> [ :o |
		   o isComposite
			   ifTrue: [ 'Composite Actor' ]
			   ifFalse: [ 'Internal Actor' ] ]).
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

	^ {  (OPDemo -> OPCoreIcons opFsmDiagramIcon).
		  (OPDemoScopeOfInterest -> OPCoreIcons opFsmInitialStateIcon).
		  (OPDemoLink -> OPCoreIcons opFsmTransitionIcon).
		  (OPDemoActor -> [ :o |
		   o isComposite
			   ifTrue: [ OPCoreIcons opFsmRegularStateIcon ]
			   ifFalse: [ OPCoreIcons opFsmFinalStateIcon ] ])} 
]

{ #category : 'widget API' }
OPDemoNavigatorAdapter >> typesByDependency [

	^ {  OPDemo.
		  OPDemoElement.
		  "OPDemoLink" }
]
