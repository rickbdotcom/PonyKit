import Foundation

public struct Pony: Decodable {
	public let id: Int
	public let name: String
	public let alias: String?
	public let url: URL
	public let sex: String?
	public let residence: Line?
	public let occupation: Line?
	public let kind: [Kind]?
	public let image: [Image]?

	public enum Line: Decodable {
		case string(String)
		case array([String])
	}

	public enum Kind: Decodable {
		case id(Int)
		case name(String)
		case full(Full)

		public struct Full: Decodable {
			let id: Int
			let name: String
			let url: URL
		}
	}

	public enum Image: Decodable {
		case id(Int)
		case url(URL)
		case full(Full)

		public struct Full: Decodable {
			let id: Int
			let name: String
			let url: URL
			let comment: String
		}
	}
}

public struct Ponies: Decodable {
	let data: [Pony]
	let status: Int
	let warning: String?
	let error: String?
}

public struct CharacterQueryParameters: Encodable {
	public let limit: Int?
	public let offset: Int?
	public let line: Line?
	public let kind: Kind?
	public let image: Image?

	public enum Line: String, Encodable {
		case string, array
	}

	public enum Kind: String, Encodable {
		case none, id, name, full
	}

	public enum Image: String, Encodable {
		case none, id, url, full
	}

	public init(limit: Int? = nil, offset: Int? = nil, line: Line? = nil, kind: Kind? = nil, image: Image? = nil) {
		self.limit = limit
		self.offset = offset
		self.line = line
		self.kind = kind
		self.image = image
	}
}

public extension Pony.Line {

	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		if let string = try? container.decode(String.self) {
			self = .string(string)
		} else {
			let array = try container.decode([String].self)
			self = .array(array)
		}
	}

	var string: String {
		switch self {
		case let .string(string):
			return string
		case let .array(array):
			return array.joined(separator: "\n")
		}
	}

	var array: [String] {
		switch self {
		case let .string(string):
			return string.components(separatedBy: "\n")
		case let .array(array):
			return array
		}
	}
}

public extension Pony.Kind {

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

public extension Pony.Image {

	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		if let id = try? container.decode(Int.self) {
			self = .id(id)
		} else if let url = try? container.decode(URL.self) {
			self = .url(url)
		} else {
			let full = try container.decode(Full.self)
			self = .full(full)
		}
	}

	var url: URL? {
		switch self {
		case let .url(url):
			return url
		case let .full(full):
			return full.url
		default:
			return nil
		}
	}
}

public struct PonyApiError: Decodable, LocalizedError {
	let status: Int
	let error: String
	let warning: String?

	public var errorDescription: String? {
		return "\(error)\n\(warning ?? "")"
	}
}
