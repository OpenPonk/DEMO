"
Metacello baseline for the OpenPonk DEMO (Design and Engineering Methodology for Organizations) plugin, defining its package dependencies and load configurations.
"
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
			with: [ spec repository: 'github://openponk/openponk:v5.0.0' ].
		spec
			baseline: 'OpenPonkModel'
			with: [ spec repository: 'github://openponk/openponk-model:v5.0.0' ].
		spec
			package: 'OpenPonk-DEMO'
			with: [
			spec requires: #( 'OpenPonkModel' ) ].
		spec group: 'plugin' with: #( 'OpenPonk-DEMO' ).
		spec group: 'default' with: #( 'OpenPonk' 'plugin' ) ]
]
