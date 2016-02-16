
import Environment

// Ensures tests pass

typealias TestResult = (String, Bool)

func testGet() -> TestResult {
    guard let path = Environment().getVar("PATH") else { return (__FUNCTION__, false) }
    return (__FUNCTION__, !path.isEmpty)
}

func testSetGet() -> TestResult {
    Environment().setVar("KITTENS", value: "FUZZY")
    let val = Environment().getVar("KITTENS")
    return (__FUNCTION__, val == "FUZZY")
}

func testRemove() -> TestResult {
    Environment().setVar("MOARKITTENS", value: "FUZZIER")
    let val = Environment().getVar("MOARKITTENS")
    guard val == "FUZZIER" else { return (__FUNCTION__, false) }
    Environment().removeVar("MOARKITTENS")
    let valFinal = Environment().getVar("MOARKITTENS")
    return (__FUNCTION__, valFinal == nil)
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
