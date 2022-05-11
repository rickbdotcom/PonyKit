import Foundation

public enum SongType: String, Encodable, Equatable {
	case none, id, name, video, full
}

public enum Song: Decodable, Equatable {
	case id([Int]), string([String]), full([Full])

	public struct Full: Identifiable, Decodable, Equatable {
		public let id: Int
		public let name: String
		public let video: String
		public let length: Time
		public let url: URL
		public let episode: Episode?
		public let musicby: Line?
		public let lyricsby: Line?
		public let keysignature: Line?
	 }
}

public extension Song {

	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		if let id = try? container.decode([Int].self) {
			self = .id(id)
		} else if let string = try? container.decode([String].self) {
			self = .string(string)
		} else {
			let full = try container.decode([Full].self)
			self = .full(full)
		}
	}
}
