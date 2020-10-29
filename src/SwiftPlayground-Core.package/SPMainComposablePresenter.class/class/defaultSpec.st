specs
defaultSpec
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :column | column newRow: #contentTextAdapter ];
		yourself