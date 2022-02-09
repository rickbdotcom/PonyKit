import XCTest
import EndpointKit
@testable import PonyKit

final class PonyKitTests: XCTestCase {
	override class func setUp() {
		super.setUp()
	}

	override class func tearDown() {
		super.tearDown()
	}

	func testCharacterEndpoints() {
		asyncTest {
			let onePony = try await PonyService.default.allCharacters(query: .init(limit: 1, offset: 1))
			XCTAssert(onePony.data.count == 1)

			let ponyId1 = try await PonyService.default.characters(byId: 1)
			XCTAssert(ponyId1.data.count == 1)
			XCTAssert(ponyId1.data[0].id == 1)
		}
	}
}
