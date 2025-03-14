Class {
	#name : 'OPDemoStandardCompositeTransaction',
	#superclass : 'OPDemoTransaction',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'accessing' }
OPDemoStandardCompositeTransaction >> beInternal [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	|newStandardInternalTransaction|
	"super beInternal."
	newStandardInternalTransaction := OPDemoStandardInternalTransaction new.
	^ newStandardInternalTransaction 
]

{ #category : 'accessing' }
OPDemoStandardCompositeTransaction >> beMultiple [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	|newMultipleCompositeTransaction|
	"super beInternal."
	newMultipleCompositeTransaction := OPDemoMultipleCompositeTransaction new.
	^ newMultipleCompositeTransaction 
]

{ #category : 'initialization' }
OPDemoStandardCompositeTransaction >> initialize [
	
	super beMultiple: false beComposite: true
]

{ #category : 'testing' }
OPDemoStandardCompositeTransaction >> isComposite [
	^ true 
]

{ #category : 'testing' }
OPDemoStandardCompositeTransaction >> isMultiple [ 
	^ false
]

{ #category : 'instance creation' }
OPDemoStandardCompositeTransaction >> new [
	
	super beMultiple: false beComposite: true
]
