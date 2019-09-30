world menu
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: 'Swift Playground')
		help: 'Interact with Swift.' translated;
		parent: #Tools;
		icon: SPResources swiftIcon;
		action: [ SwiftPlayground openPlayground ];
		order: 11