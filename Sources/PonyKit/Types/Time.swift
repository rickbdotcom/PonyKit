import Foundation

public enum TimeType: String, Encodable, Equatable {
	case iso, second
}

public enum Time: Decodable, Equatable {
	case iso(String), seconds(Int)
}

public extension Time {

	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		if let string = try? container.decode(String.self) {
			self = .iso(string)
		} else {
			let seconds = try container.decode(Int.self)
			self = .seconds(seconds)
		}
	}

	var seconds: Int {
		switch self {
		case let .iso(string):
			let hms = string.components(separatedBy: ":").compactMap { Int($0) }
			if hms.count != 3 { return 0}
			return hms[0] * 3600 + hms[1] * 60 + hms[0]
		case let .seconds(seconds):
			return seconds
		}
	}
}
