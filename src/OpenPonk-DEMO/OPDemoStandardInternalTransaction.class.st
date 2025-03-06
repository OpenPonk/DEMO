Class {
	#name : 'OPDemoStandardInternalTransaction',
	#superclass : 'OPDemoTransaction',
	#category : 'OpenPonk-DEMO-Models',
	#package : 'OpenPonk-DEMO',
	#tag : 'Models'
}

{ #category : 'accessing' }
OPDemoStandardInternalTransaction >> beComposite [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	|newStandardCompositeTransaction|
	"super beInternal."
	newStandardCompositeTransaction := OPDemoStandardCompositeTransaction new.
	^ newStandardCompositeTransaction 
]

{ #category : 'accessing' }
OPDemoStandardInternalTransaction >> beMultiple [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	|newMultipleInternalTransaction|
	"super beInternal."
	newMultipleInternalTransaction := OPDemoMultipleInternalTransaction new.
	^ newMultipleInternalTransaction 
]

{ #category : 'initialization' }
OPDemoStandardInternalTransaction >> initialize [

	super beMultiple: false beComposite: false
]

{ #category : 'testing' }
OPDemoStandardInternalTransaction >> isComposite [
	
	^ super isComposite 
]

{ #category : 'testing' }
OPDemoStandardInternalTransaction >> isMultiple [

	^ super isMultiple
]

{ #category : 'instance creation' }
OPDemoStandardInternalTransaction >> new [

	super beMultiple: false beComposite: false
]
