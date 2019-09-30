accessing - icons
swiftIcon
	"Private - Generated method"

	^ self icons
		at: #swiftIcon
		ifAbsentPut: [ Form
				fromBinaryStream: self swiftIconContents contents base64Decoded readStream
			]