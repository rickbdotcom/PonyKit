import Foundation

public struct Pony: Identifiable, Decodable, Equatable {
	public let id: Int
	public let name: String
	public let alias: String?
	public let url: URL
	public let sex: String?
	public let residence: Line?
	public let occupation: Line?
	public let kind: [Kind]?
	public let image: [Image]?
}

public struct Ponies: Decodable, Equatable {
	public let data: [Pony]
	public let status: Int
	public let warning: String?
	public let error: String?
}
