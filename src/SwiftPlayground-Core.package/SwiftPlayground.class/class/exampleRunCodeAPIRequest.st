examples
exampleRunCodeAPIRequest
	<sampleInstance>
	| swiftCode |
	swiftCode := 'let sessionConfig = URLSessionConfiguration.default
let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
let url = URL(string: "https://en.gravatar.com/5658ffccee7f0ebfda2b226238b1eb6e.json")!

var request = URLRequest(url: url)
request.httpMethod = "GET"

let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
	if let uError = error {
//		fatalError(uError.localizedDescription)
		print(uError.localizedDescription)
	} else if let uData = data, let string = String(data: uData, encoding: String.Encoding.utf8) {
		print(string)
	}
	exit(0)
})

task.resume()
session.finishTasksAndInvalidate()

dispatchMain()'.
	self new evaluate: swiftCode completion: [ :output | ^ output ]