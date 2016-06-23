
@testable import Environment
import XCTest

class EnvironmentTests: XCTestCase {

    func testGet() {
        guard let path = Env["PATH"] else { XCTFail(); return }
        XCTAssert(!path.isEmpty)
    }

    func testSetGet() {
        Env["KITTENS"] = "FUZZY"
        let val = Env["KITTENS"]
        XCTAssertEqual(val, "FUZZY")
    }

    func testRemove() {
        Env["MOARKITTENS"] = "FUZZIER"
        let val = Env["MOARKITTENS"]
        guard val == "FUZZIER" else { XCTFail(); return }
        Env["MOARKITTENS"] = nil
        let valFinal = Env["MOARKITTENS"]
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

