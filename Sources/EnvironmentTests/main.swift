
import Environment

// Ensures tests pass

typealias TestResult = (String, Bool)

func testGet() -> TestResult {
    guard let path = Environment().getVar("PATH") else { return (#function, false) }
    return (#function, !path.isEmpty)
}

func testSetGet() -> TestResult {
    Environment().setVar("KITTENS", value: "FUZZY")
    let val = Environment().getVar("KITTENS")
    return (#function, val == "FUZZY")
}

func testRemove() -> TestResult {
    Environment().setVar("MOARKITTENS", value: "FUZZIER")
    let val = Environment().getVar("MOARKITTENS")
    guard val == "FUZZIER" else { return (#function, false) }
    Environment().removeVar("MOARKITTENS")
    let valFinal = Environment().getVar("MOARKITTENS")
    return (#function, valFinal == nil)
}

// Run
var failCount = 0
[
    testGet,
    testSetGet,
    testRemove
].forEach {
    let res = $0()
    if res.1 {
        print("\(res.0) succeeded")
    } else {
        print("\(res.0) failed")
        failCount += 1
    }
}
if failCount > 0 {
    fatalError("\(failCount) Tests Failed")
}
