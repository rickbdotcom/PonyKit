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
		test(PonyService.default.allCharacters(query: nil), "all characters")
		wait()
	}

	func test<P: Publisher>(_ endpoint: P, _ description: String) {
		let expectation = XCTestExpectation(description: description)
		expectations.append(expectation)

		endpoint
			.expectation(expectation)
			.print()
			.sink(receiveCompletion: { _ in }, receiveValue: { _ in })
			.store(in: &subscriptions)
	}

	func wait() {
		wait(for: expectations, timeout: 10.0)
		subscriptions.removeAll()
		expectations.removeAll()
	}
}
