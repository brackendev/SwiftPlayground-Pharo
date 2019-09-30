*SwiftPlayground-Extensions
runSwift
	SwiftPlayground shared
		evaluate: self
		completion: [ :output | ^ output withoutTrailingNewlines ]