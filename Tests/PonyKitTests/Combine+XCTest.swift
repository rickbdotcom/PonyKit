import Combine
import Foundation
import XCTest

extension Publisher {

	func expectation(_ expectation: XCTestExpectation?, file: StaticString = #filePath, line: UInt = #line) -> AnyPublisher<Output, Failure> {
		handleEvents(receiveCompletion: { completion in
			if case let .failure(error) = completion {
				XCTFail(error.localizedDescription, file: file, line: line)
			}
			expectation?.fulfill()
		}).eraseToAnyPublisher()
	}
}
