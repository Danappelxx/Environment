
@testable import Environment
import XCTest

class EnvironmentTests: XCTestCase {

    func testGet() {
        guard let path = Environment.getVar("PATH") else { XCTFail(); return }
        XCTAssert(!path.isEmpty)
    }

    func testSetGet() {
        Environment.setVar("KITTENS", value: "FUZZY")
        let val = Environment.getVar("KITTENS")
        XCTAssertEqual(val, "FUZZY")
    }

    func testRemove() {
        Environment.setVar("MOARKITTENS", value: "FUZZIER")
        let val = Environment.getVar("MOARKITTENS")
        guard val == "FUZZIER" else { XCTFail(); return }
        Environment.removeVar("MOARKITTENS")
        let valFinal = Environment.getVar("MOARKITTENS")
        XCTAssertNil(valFinal)
    }
}

extension EnvironmentTests {
    static var allTests : [(String, (EnvironmentTests) -> () throws -> Void)] {
        return [
            ("testGet", testGet),
            ("testSetGet", testSetGet),
            ("testRemove", testRemove)
        ]
    }
}

