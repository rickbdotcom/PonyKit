import Foundation

public enum DateType: String, Encodable {
	case iso, american, european, timestamp
}

public enum APIDate: Decodable {
	case dateString(String), timestamp(Int)
}

public extension APIDate {

	init(from decoder: Decoder) throws { // unfortunately decoder can't distinguish between European and American
		let container = try decoder.singleValueContainer()
		if let timestamp = try? container.decode(Int.self) {
			self = .timestamp(timestamp)
		} else {
			let dateString = try container.decode(String.self)
			self = .dateString(dateString)
		}
	}

	var date: Date? {
		timestampDate ?? isoDate ?? americanDate ?? europeanDate
	}

	var americanDate: Date? {
		switch self {
		case .timestamp:
			return nil
		case let .dateString(dateString):
			let formatter = DateFormatter()
			formatter.dateFormat = "mm/dd/yyyy"
			return formatter.date(from: dateString)
		}
	}

	var europeanDate: Date? {
		switch self {
		case .timestamp:
			return nil
		case let .dateString(dateString):
			let formatter = DateFormatter()
			formatter.dateFormat = "dd/mm/yyyy"
			return formatter.date(from: dateString)
		}
	}

	var isoDate: Date? {
		switch self {
		case .timestamp:
			return nil
		case let .dateString(dateString):
			let formatter = DateFormatter()
			formatter.dateFormat = "yyyy-mm-dd"
			return formatter.date(from: dateString)
		}
	}

	var timestampDate: Date? {
		switch self {
		case let .timestamp(timestamp):
			return Date(timeIntervalSince1970: Double(timestamp))
		case .dateString:
			return nil
		}
	}

	var isAmbiguous: Bool {
		europeanDate != nil && americanDate != nil
	}
}

