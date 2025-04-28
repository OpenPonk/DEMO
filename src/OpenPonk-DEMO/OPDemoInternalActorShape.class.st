"
I am responsible for displaying an intrernal Actor Role
"
Class {
	#name : 'OPDemoInternalActorShape',
	#superclass : 'OPDemoActorShape',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPDemoInternalActorShape >> labelCenterPosition [
	^ RSLocation new
	
]

{ #category : 'rendering' }
OPDemoInternalActorShape >> labelTopPosition [
	|returnLocation|
	returnLocation := RSLocation new.
	returnLocation top.
	returnLocation center.
	returnLocation offset: 0@5.
	^ returnLocation 
	
]

{ #category : 'rendering' }
OPDemoInternalActorShape >> renderShapeDetails [
	|location|
	super renderShapeDetails.
	
	label := RSLabel new
		         color: Color black;
					fontSize: 17;
					bold;
		         height: 11;
		         model: self;
		         yourself.
	label text: self modelElement name.
	RSLocation new stick: label on: self roassalShape.
	
	
	label_second := RSLabel new
					color: Color black;
					height: 11;
					model: self;
					yourself.
	"label text: self modelElement name."
	location := RSLocation new
					bottom;
					yourself.
	location stick: label_second on: self roassalShape.
	
	
	self canvas add: label;
					add: label_second .
]

{ #category : 'rendering' }
OPDemoInternalActorShape >> updateRenderFromModel [
	|location|
	location := RSLocation new.
	label text: self modelElement name.
	self modelElement transactionCount=1 ifTrue: [ location := self labelTopPosition ].
	self modelElement transactionCount=0 ifTrue: [ location := self labelCenterPosition ].
	location stick: label on: self roassalShape .
	label_second text: self modelElement labelActor.
	super updateRenderFromModel.
	roassalShape signalUpdate
]
