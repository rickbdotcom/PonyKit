import Foundation

public enum KindType: String, Encodable, Equatable {
	case none, id, name, full
}

public enum Kind: Decodable, Equatable {
	case id(Int)
	case name(String)
	case full(Full)

	public struct Full: Decodable, Equatable {
		let id: Int
		let name: String
		let url: URL
	}
}

public extension Kind {

	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		if let id = try? container.decode(Int.self) {
			self = .id(id)
		} else if let name = try? container.decode(String.self) {
			self = .name(name)
		} else {
			let full = try container.decode(Full.self)
			self = .full(full)
		}
	}
}
