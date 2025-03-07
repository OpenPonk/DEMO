Class {
	#name : 'OPDemoScopeOfInterestShape',
	#superclass : 'OPDemoElementShape',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPDemoScopeOfInterestShape >> renderBasicShape [

	^ RSBox new
		  width: 800;
		  height: 600;
		  borderWidth: 6;
		  borderColor: Color gray;
		  color: Color transparent;
		  yourself

]

{ #category : 'rendering' }
OPDemoScopeOfInterestShape >> selectableInteraction [

	^ OPRSSelectable highlightBorderColorBlue
]

{ #category : 'rendering' }
OPDemoScopeOfInterestShape >> shouldBePositionableByUser [

	^ true
]

{ #category : 'rendering' }
OPDemoScopeOfInterestShape >> shouldBeResizableByUser [

	^ true
]
