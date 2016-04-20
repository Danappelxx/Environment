# Environment

[![Build Status](https://travis-ci.org/czechboy0/Environment.svg?branch=master)](https://travis-ci.org/czechboy0/Environment)
![Platforms](https://img.shields.io/badge/platforms-Linux%20%7C%20OS%20X-blue.svg)
![Package Managers](https://img.shields.io/badge/package%20managers-SwiftPM-yellow.svg)

[![Blog](https://img.shields.io/badge/blog-honzadvorsky.com-green.svg)](http://honzadvorsky.com)
[![Twitter Czechboy0](https://img.shields.io/badge/twitter-czechboy0-green.svg)](http://twitter.com/czechboy0)

> Easy access to environment variables from Swift. Linux & OS X ready.

# Installation

## Swift Package Manager

```swift
.Package(url: "https://github.com/czechboy0/Environment.git", majorVersion: 0)
```

## CocoaPods

```ruby
pod 'Environment'
```

# Usage
Easily get, set and remove environment variables.

```swift
Environment().getVar("PATH") //Optional("/Users/honzadvorsky/")
Environment().setVar("TEST_RESULT", value: "1")
Environment().removeVar("TEST_RESULT")
```

:gift_heart: Contributing
------------
Please create an issue with a description of your problem or open a pull request with a fix.

:v: License
-------
MIT

:alien: Author
------
Honza Dvorsky - http://honzadvorsky.com, [@czechboy0](http://twitter.com/czechboy0)
