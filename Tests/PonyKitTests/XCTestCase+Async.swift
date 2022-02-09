//
//  File.swift
//
//
//  Created by rickb on 11/20/21.
//

import Foundation
import XCTest

extension XCTestCase {

	func asyncTest(
		named testName: String = #function,
		in file: StaticString = #file,
		at line: UInt = #line,
		withTimeout timeout: TimeInterval = 10,
		test: @escaping () async throws -> Void
	) {
		var thrownError: Error?
		let errorHandler = { thrownError = $0 }
		let expectation = expectation(description: testName)

		Task {
			do {
				try await test()
			} catch {
				errorHandler(error)
			}

			expectation.fulfill()
		}

		waitForExpectations(timeout: timeout)

		if let error = thrownError {
			XCTFail(
				"Async error thrown: \(error)",
				file: file,
				line: line
			)
		}
	}
}
