"
I am responsible for displaying a composite Actor Role
"
Class {
	#name : 'OPDemoCompositeActorShape',
	#superclass : 'OPDemoActorShape',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPDemoCompositeActorShape >> renderBasicShape [

	^ super renderBasicShape color: Color gray;
	yourself
]

{ #category : 'rendering' }
OPDemoCompositeActorShape >> renderShapeDetails [
	|location|
	super renderShapeDetails.

	label := RSLabel new
		         color: Color black;
					fontSize: 17;
					bold;
		         height: 11;
		         model: self;
		         yourself.
		
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
					add: label_second.
]

{ #category : 'rendering' }
OPDemoCompositeActorShape >> updateRenderFromModel [

	label text: self modelElement name.
	label_second text: self modelElement labelActor.
	super updateRenderFromModel.
	roassalShape signalUpdate
]
