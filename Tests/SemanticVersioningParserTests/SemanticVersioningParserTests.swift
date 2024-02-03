import XCTest
@testable import SemanticVersioningParser

final class SemanticVersioningParserTests: XCTestCase {
    func testVersionParsing() throws {
        let versionString = "1.2.3"
        let version = try SemanticVersioning.parse(versionString: versionString)
        XCTAssertEqual(version.major, 1)
        XCTAssertEqual(version.minor, 2)
        XCTAssertEqual(version.patch, 3)

        let invalidVersionString = "1.2"
        do {
            let _ = try SemanticVersioning.parse(versionString: invalidVersionString)
            XCTFail()
        } catch {
            print(error)
        }
    }

    func testVersionComparison() {
        let version1 = SemanticVersioning(major: 1, minor: 2, patch: 3)
        let version2 = SemanticVersioning(major: 1, minor: 2, patch: 4)
        let version3 = SemanticVersioning(major: 2, minor: 1, patch: 0)
        let version4 = SemanticVersioning(major: 2, minor: 2, patch: 1)

        XCTAssertTrue(version1 < version2)
        XCTAssertTrue(version3 < version4)
    }
}
