import Foundation

public struct PonyApiError: Decodable, LocalizedError {
	let status: Int
	let error: String
	let warning: String?

	public var errorDescription: String? {
		return "\(error)\n\(warning ?? "")"
	}
}
