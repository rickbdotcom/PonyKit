import Foundation

public enum LineType: String, Encodable {
	case string, array
}

public enum Line: Decodable {
	case string(String)
	case array([String])
}

public extension Line {

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
