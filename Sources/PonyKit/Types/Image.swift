import Foundation

public enum ImageType: String, Encodable {
	case none, id, url, full
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

public extension Image {

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
