Class {
	#name : 'OPDemoMultipleCompositeTransaction',
	#superclass : 'OPDemoTransaction',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'accessing' }
OPDemoMultipleCompositeTransaction >> beInternal [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	|newMultipleInternalTransaction|
	"super beInternal."
	newMultipleInternalTransaction := OPDemoMultipleInternalTransaction new.
	^ newMultipleInternalTransaction 
]

{ #category : 'accessing' }
OPDemoMultipleCompositeTransaction >> beStandard [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	|newStandardCompositeTransaction|
	"super beInternal."
	newStandardCompositeTransaction := OPDemoStandardCompositeTransaction new.
	^ newStandardCompositeTransaction 
]

{ #category : 'initialization' }
OPDemoMultipleCompositeTransaction >> initialize [
	
	super beMultiple: true beComposite: true
]

{ #category : 'testing' }
OPDemoMultipleCompositeTransaction >> isComposite [
	^ true 
]

{ #category : 'testing' }
OPDemoMultipleCompositeTransaction >> isMultiple [
	^ true
]

{ #category : 'instance creation' }
OPDemoMultipleCompositeTransaction >> new [
	
	super beMultiple: true beComposite: true
]
