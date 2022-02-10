import Foundation

public enum EpisodeType {
	case none, id, name, full
}
public enum Episode: Decodable {
	case id(Int)
	case title(String)
	case full(Full)

	public struct Full: Identifiable, Decodable {
		public let id: Int
		public let name: String
		public let image: Image
		public let url: URL
		public let season: Int?
		public let episode: Int?
		public let overall: Int?
		public let airdate: APIDate?
		public let storyby: Line?
		public let writtenby: Line?
		public let storyboard: Line?
		public let song: Song?
	}
}

public struct Episodes: Decodable {
	public let data: [Episode.Full]
	public let status: Int
	public let warning: String?
	public let error: String?
}

public extension Episode {

	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		if let id = try? container.decode(Int.self) {
			self = .id(id)
		} else if let title = try? container.decode(String.self) {
			self = .title(title)
		} else {
			let full = try container.decode(Full.self)
			self = .full(full)
		}
	}
}
