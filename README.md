Due to the fragility of Xcode's Swift Playgrounds, this Pharo implementation is a robust Swift code runner with the added benefits of working with Swift output in the powerful Pharo environment and accessing Swift ASTs.

- - -

SwiftPlayground-Pharo
===

**Interact with Swift on Pharo.**

Run Swift code within Pharo via the integrated Swift Playground or within Pharo Smalltalk code. Inspect output, inspect Swift ASTs, and more.

* [Pharo 7.0](https://www.pharo.org/) reference platform.
* Requires macOS 10.14.5 (or later) ***or*** GNU/Linux (tested with Ubuntu 14.04, 64 bit).
  * SeasideSwift should run on Windows with little to no modifications but has not been tested yet. See [Running Pharo in Windows Subsystem for Linux (WSL)](https://fuhrmanator.github.io/2019/02/27/Pharo-in-WSL.html) and [Swift for Windows](https://swiftforwindows.github.io).

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
* [API Reference](#api-reference)
  * [Swift Compilation and Output](#swift-compilation-and-output)
  * [Pharo Object to Swift String Serialization](#pharo-object-to-swift-string-serialization)
  * [Swift Response String to Pharo Object Deserialization](#swift-response-string-to-pharo-object-deserialization)
  * [Asynchronous Swift Code](#asynchronous-swift-code)
  * [Error Handling](#error-handling)
* [TODO](#todo)
* [Acknowledgements](#acknowledgements)
* [Author](#author)
* [License](#license)

## Installation

1. Install and setup the Swift tools for your environment:
    * **macOS:** Install the [Command Line Tools (macOS 10.14) for Xcode 10.2.1](https://developer.apple.com/download/more/?=command%20line%20tools) (or later).
    * **GNU/Linux:** [Install Swift](https://www.swift.org/getting-started/#installing-swift) from [swift.org](https://www.swift.org/).
2. In a Playground, evaluate:

    ```smalltalk
    Metacello new
      repository: 'github://brackendev/SwiftPlayground-Pharo';
      baseline: 'SwiftPlayground';
      onConflict: [ :ex | ex useIncoming ];
      onUpgrade: [ :ex | ex useIncoming ];
      onDowngrade: [ :ex | ex useLoaded ];
      ignoreImage;
      load.
    ```

## Usage

#### 🔹 Swift Playground

Write, compile, run, and inspect output of Swift code via the Swift Playground (accessible via the Tools menu).

![](images/screenshot1.png)

![](images/screenshot4.png)

##### Important contextual menu items:

* `Do it` – Compile and run the selected Swift code
* `Inspect it` – Compile and run the selected Swift code, inspect it
* `Print it` – Compile and run the selected Swift code, print it (**TODO**)

Additionally, the contextual menu item, `Inspect AST`, returns the Swift [AST](https://en.wikipedia.org/wiki/Abstract_syntax_tree) for the selected Swift code. For example, `print("Hello, World!")` returns:

```
(import_decl range=[Swift:1:1 - line:1:8] 'Foundation')
  (top_level_code_decl range=[Swift:2:1 - line:2:22]
    (brace_stmt range=[Swift:2:1 - line:2:22]
      (call_expr type='<null>' arg_labels=_:
        (unresolved_decl_ref_expr type='<null>' name=print function_ref=unapplied)
        (paren_expr type='<null>'
          (string_literal_expr type='<null>' encoding=utf8 value="Hello, World!" builtin_initializer=**NULL** initializer=**NULL**)))))
```

#### 🔹 Inline Swift

Outside of the Swift Playground, Swift code can be executed within Pharo code by using the `runSwift` string class extension. For example:

![](images/screenshot3.png)

## API Reference

### Swift Compilation and Output

#### ▪️ String class extension: `runSwift`

The output is a string reponse returned from the Swift code by using [print](https://developer.apple.com/documentation/swift/1541053-print). For example:
	
```smalltalk
swiftString := 'The five boxing wizards jump quickly' asLowercase asSwiftString.
('let (lowercased, alphabet) = (Set(', swiftString, '), "abcdefghijklmnopqrstuvwxyz")
print("\(!alphabet.contains { !lowercased.contains($0) })")') runSwift.
"Returns 'true'"
```

Tip: Simple code does not require [print](https://developer.apple.com/documentation/swift/1541053-print). For example:

```smalltalk
'Array("ABCDE")' runSwift.
"Returns '["A", "B", "C", "D", "E"]'"
```

```smalltalk
swiftArray := #(1 2 3 4 5) asSwiftArray.
(swiftArray, '.map{$0 * $0}.reduce(0, +)') runSwift.
"Returns '55'"
```

### Pharo Object to Swift String Serialization

Pharo class extension methods can be used as quick helpers to serialize Pharo objects to Swift psuedo-objects (string representations of Swift objects). For example, `'Hello, World!' asSwiftString` returns `'"Hello, World!"'`.

In the code below, notice the usage of `sentence`, `asSwiftString`, and the `swiftCode` string concatenation:

```smalltalk
sentence := 'The five boxing wizards jump quickly' asLowercase asSwiftString.
swiftCode := ('
// Swift code to determine a pangram
let (sentenceSet, alphabet) = (Set(', sentence, '), "abcdefghijklmnopqrstuvwxyz")
print(!alphabet.contains {
  !sentenceSet.contains($0)
})
').
swiftCode runSwift.
"Returns 'true'"
```

The following extension methods have been implemented (with examples). The examples are also availabe via the `SPExamples` object.

#### ▪️ Array class extension: `asSwiftArray`

Currently only handles one depth of booleans, numbers, and strings.

```smalltalk
#(1 'A' 2 true 3 false) asSwiftArray.
"Returns '[1,"A",2,true,3,false]'"
```

#### ▪️ Boolean class extension: `asSwiftBoolean`

```smalltalk
true asSwiftBoolean.
"Returns 'true'"
```

#### ▪️ Dictionary class extension: `asSwiftDictionary`

Currently only handles one depth of booleans, numbers, and strings.

```smalltalk
(Dictionary newFrom: {(1 -> 2). ('A' -> 3). (4 -> 'B'). (5 -> true). (false -> 'C'). ('D' -> 'E')})  asSwiftDictionary.
"Returns '[1:2,"A":3,4:"B",5:true,"D":"E",false:"C"]'"
```

#### ▪️ String class extension: `asSwiftString`

```smalltalk
'Hello, World!' asSwiftString.
"Returns '"Hello, World!"'."
```

### Swift Response String to Pharo Object Deserialization

**(TODO)**

### Asynchronous Swift Code

To prevent asynchronous Swift code from exiting too early, use [dispatchMain()](https://developer.apple.com/documentation/dispatch/1452860-dispatchmain) to never return and use [exit(0)](https://developer.apple.com/documentation/foundation/thread/1409404-exit) to exit when the program should be complete.

For example, in the Swift code below, a [URLRequest](https://developer.apple.com/documentation/foundation/urlrequest) network request session is started and then followed by `dispatchMain()` so the program does not prematurely exit. In the session response closure `exit(0)` will be called to exit the program.

```swift
let sessionConfig = URLSessionConfiguration.default
let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)

var url = URL(string: "https://www.gravatar.com/4f64c9f81bb0d4ee969aaf7b4a5a6f40.json")
var request = URLRequest(url: url!)
request.httpMethod = "GET"

let task = session.dataTask(with: request, completionHandler: { data, response, error in
    if let uError = error {
        print(uError.localizedDescription) // Returns error string
    } else if let uData = data, let string = String(data: uData, encoding: String.Encoding.utf8) {
        print(string) // Returns response string
    }
    exit(0) // Exit after asynchronous work is complete
})
task.resume()

session.finishTasksAndInvalidate() // Start the network request session
dispatchMain() // Prevent premature exit
```

### Error Handling

If [LLVM](https://llvm.org) errors are encountered during compilation or while executing, Pharo errors will be thrown. For example:

![](images/screenshot2.png)

## TODO

- [ ] Swift Playground `Print it`
- [ ] Swift Playground syntax highlighting
- [ ] Swift response string to Pharo object deserialization
- [ ] Move documentation to the wiki
- [ ] Move to Spec2

## Acknowledgements

This project makes use of the following third-party libraries:

* [OSSubprocess](https://github.com/pharo-contributions/OSSubprocess)

## Author

[brackendev](https://www.github.com/brackendev)

## License

SwiftPlayground-Pharo is released under the MIT license. See the LICENSE file for more info.
