//
//  Bundle.swift
//  PonyApp
//
//  Created by RICHARD BURGESS on 5/11/22.
//

import Foundation

extension Bundle {

	func decode<T: Decodable>(path: String, as type: T.Type = T.self, decoder: JSONDecoder = JSONDecoder()) throws -> T {
		guard let url = url(forResource: path, withExtension: "json") else {
			throw BundleError.urlNotFound
		}
		let data = try Data(contentsOf: url)
		return try decoder.decode(type, from: data)
	}
}

private enum BundleError: Error {
	case urlNotFound
}
