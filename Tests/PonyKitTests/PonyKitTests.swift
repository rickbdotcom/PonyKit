import Combine
import XCTest
import EndpointKit
@testable import PonyKit

final class PonyKitTests: XCTestCase {
	var subscriptions = Set<AnyCancellable>()
	var expectations = [XCTestExpectation]()

	override class func setUp() {
		super.setUp()
		URLSession.DataTaskPublisher.setDebugResponse(true)
	}

	override class func tearDown() {
		super.tearDown()
		URLSession.DataTaskPublisher.setDebugResponse(false)
	}

	func testCharacterEndpoints() {
		test(PonyService.default.allCharacters(), "all characters")
		test(PonyService.default.allCharacters(query: .init(limit: 1, offset: 1)), "all characters, limit: 1, offset: 1") { ponies in
			XCTAssert(ponies.data.count == 1)
		}
		test(PonyService.default.characters(byId: 1), "characters by Id: 1") { ponies in
			XCTAssert(ponies.data.count == 1)
			XCTAssert(ponies.data[0].id == 1)
		}
		wait()
	}

	func test<P: Publisher>(_ publisher: P, _ description: String, receiveValue: ((P.Output) -> Void)? = nil) {
		let expectation = XCTestExpectation(description: description)
		expectations.append(expectation)

		publisher
			.expectation(expectation)
			.sink(receiveCompletion: { _ in
			}, receiveValue: {
				receiveValue?($0)
			})
			.store(in: &subscriptions)
	}

	func wait() {
		wait(for: expectations, timeout: 10.0)
		subscriptions.removeAll()
		expectations.removeAll()
	}
}
