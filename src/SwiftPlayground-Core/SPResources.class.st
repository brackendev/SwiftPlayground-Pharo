"
I am SPResources, an object to store icons for SwiftPlayground.
"
Class {
	#name : #SPResources,
	#superclass : #Object,
	#classVars : [
		'icons'
	],
	#category : 'SwiftPlayground-Core'
}

{ #category : #'GT-InspectorExtensions' }
SPResources class >> gtInspectorIconsIn: composite [
	<gtInspectorPresentationOrder: 0>
	<script: 'self inspect'>
	composite table
		title: 'Icons';
		display: [ (self class selectorsInCategory: 'accessing - icons') sorted
				collect: [ :each | each -> (self perform: each) ] ];
		column: 'Icon' evaluated: #value width: 50;
		column: 'Selector' evaluated: #key
]

{ #category : #accessing }
SPResources class >> icons [
	^ icons ifNil: [ icons := Dictionary new ]
]

{ #category : #'accessing - reset' }
SPResources class >> resetIcons [
	<script>
	^ icons := nil
]

{ #category : #'accessing - icons' }
SPResources class >> swiftIcon [
	"Private - Generated method"

	^ self icons
		at: #swiftIcon
		ifAbsentPut: [ Form
				fromBinaryStream: self swiftIconContents contents base64Decoded readStream
			]
]

{ #category : #'private - contents' }
SPResources class >> swiftIconContents [
	"Private - Method generated with the content of the file File @ swift.png"

	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAolBMVEVHcEz/bQD//////fz/bQD/bADmShn/bQD/bQDtUxL++PbmTBzzqJD/dA3nTx/+awH/4MjsUhP/ehb+exzyWw3oWi3rb0j/zaf/u4j/dhD/cAX8yKrtXiT/bgH5vqT/eRXugV//lUXynoP8vZb5rofyXxT/oVv/lkj/+PT/giTwkHHyn4Xuhmb0rpj1tJ//o1/nUCH2wK/1tqL1t6PvjW774trbsUGsAAAACnRSTlMA////m5n//JrZM19/sQAAAHxJREFUGNONz0kWgkAMRVESNKVlgdiLCqjY9w3sf2tEDMWUN7yDnB/HaVCXuDFwqlUCle2jnwj4E6LebsEiMF3fiExaA12/91fmngUGLB+dv/Ep0F/xhQciHgRgFG8vRiPOK4Dh0kU8zQILAMnmGIInoMD2H9axotpNXi0Ay/sGtc5AHIgAAAAASUVORK5CYII='
]
