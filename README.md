
[![forthebadge](https://forthebadge.com/images/badges/open-source.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)

# <img src="https://wren.io/wren.svg" valign="middle" width="100"> wren-benchie 

![MIT licensed](https://badgen.net/badge/license/MIT/cyan?scale=1.5)
![version 0.1](https://badgen.net/badge/version/0.1.0/green?scale=1.5)
![wren 0.4](https://badgen.net/badge/wren/0.4/blue?scale=1.5)

A tiny module for benchmarking in [Wren](https://wren.io).


### What it looks like

```
Buffers
-----------------------------------------------------
Buffer (char in, char out)         14.46 ops/sec
Buffer (word in, char out)         85.73 ops/sec
Buffer (packet in, char out)       117.38 ops/sec
Buffer (char in, readAll)          1.4 ops/sec
Buffer (word in, readAll)          9.48 ops/sec
Buffer (packet in, readAll)        2702.86 ops/sec
```

### Example

```dart
import "./wren-benchie/benchie" for Benchmark

var tests = Benchmark.new("Buffers")
var data = Map.new()
tests.before {
    data["char"] = CharSource.new(20000).build()
    // ...
}
tests.add("Buffer (char in, char out)") {
    var b = Buffer.new(100000)
    data["char"].data.each { |e| tests.add(e) }
    while (tests.readChar()) {}
}
tests.add("Buffer (word in, char out)") { // ... }
tests.add("Buffer (packet in, char out)") { // ... }
tests.add("Buffer (char in, readAll)") { // ... }
// ...
tests.run()
```

### API

- `new(suiteName)` - create a new test suite
- `add(testName, testFn)` - add a test case
- `before(fn)` - run a function before your tests begin
- `after(fn)` - run a function after your tests finish
- `run()` - run tests

### Contributions

Licensed MIT and open to contributions!  

Please open an issue to discuss or find me on [Wren Discord](https://discord.gg/VTzuWmBavH).