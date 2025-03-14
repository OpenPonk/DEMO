Class {
	#name : 'OPDemoMultipleInternalTransaction',
	#superclass : 'OPDemoTransaction',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'accessing' }
OPDemoMultipleInternalTransaction >> beComposite [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	|newMultipleCompositeTransaction|
	"super beInternal."
	newMultipleCompositeTransaction := OPDemoMultipleCompositeTransaction new.
	^ newMultipleCompositeTransaction 
]

{ #category : 'accessing' }
OPDemoMultipleInternalTransaction >> beStandard [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	|newStandardInternalTransaction|
	"super beInternal."
	newStandardInternalTransaction := OPDemoStandardInternalTransaction new.
	^ newStandardInternalTransaction 
]

{ #category : 'initialization' }
OPDemoMultipleInternalTransaction >> initialize [
	
	super beMultiple: true beComposite: false
]

{ #category : 'testing' }
OPDemoMultipleInternalTransaction >> isComposite [
	^ false
]

{ #category : 'testing' }
OPDemoMultipleInternalTransaction >> isMultiple [
	^ true 
]

{ #category : 'instance creation' }
OPDemoMultipleInternalTransaction >> new [
	
	super beMultiple: true beComposite: false
]
