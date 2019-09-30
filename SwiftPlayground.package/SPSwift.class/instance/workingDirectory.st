private - file in/out
workingDirectory
	| dir |
	dir := FileSystem disk workingDirectory / 'SwiftPlayground-tmp'.
	dir createDirectory.
	^ dir