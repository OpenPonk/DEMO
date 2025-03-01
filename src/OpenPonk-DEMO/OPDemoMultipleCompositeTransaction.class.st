Class {
	#name : 'OPDemoMultipleCompositeTransaction',
	#superclass : 'OPDemoTransaction',
	#category : 'OpenPonk-DEMO-DiagramElements',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramElements'
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
	
	^ super isComposite 
]

{ #category : 'testing' }
OPDemoMultipleCompositeTransaction >> isMultiple [
	
	^ super isMultiple 
]

{ #category : 'instance creation' }
OPDemoMultipleCompositeTransaction >> new [
	
	super beMultiple: true beComposite: true
]
