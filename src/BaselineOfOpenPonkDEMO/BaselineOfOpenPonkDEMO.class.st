Class {
	#name : 'BaselineOfOpenPonkDEMO',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfOpenPonkDEMO',
	#package : 'BaselineOfOpenPonkDEMO'
}

{ #category : 'baselines' }
BaselineOfOpenPonkDEMO >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			baseline: 'OpenPonk'
			with: [ spec repository: 'github://openponk/openponk' ].
		spec
			baseline: 'OpenPonkModel'
			with: [ spec repository: 'github://OpenPonk/openponk-model' ].
		spec
			package: 'OpenPonk-DEMO'
			with: [
			spec requires: #( 'OpenPonkModel' ) ].
		spec group: 'plugin' with: #( 'OpenPonk-DEMO' ).
		spec group: 'default' with: #( 'OpenPonk' 'plugin' ) ]
]
