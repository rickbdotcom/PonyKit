import EndpointKit
import Foundation

public protocol EpisodeQueryEndpoint: APIEndpoint where Parameters == EpisodeQueryParameters, Response == Episodes {
}

public struct GetAllEpisodes: EpisodeQueryEndpoint {
	public let parameters: EpisodeQueryParameters
	public let endpoint: Endpoint = "GET episode/all"

	public init(parameters: EpisodeQueryParameters) {
		self.parameters = parameters
	}
}

public struct GetEpisodesById: EpisodeQueryEndpoint {
	public let id: Int
	public let parameters: EpisodeQueryParameters
	public var endpoint: Endpoint { .init("episode/\(id)", .get) }

	public init(id: Int, parameters: EpisodeQueryParameters) {
		self.id = id
		self.parameters = parameters
	}
}

public struct GetEpisodesByOverall: EpisodeQueryEndpoint {
	public let overall: Int
	public let parameters: EpisodeQueryParameters
	public var endpoint: Endpoint { .init("episode/by-overall/\(overall)", .get) }

	public init(overall: Int, parameters: EpisodeQueryParameters) {
		self.overall = overall
		self.parameters = parameters
	}
}

public struct GetEpisodesBySeasonEpisode: EpisodeQueryEndpoint {
	public let season: Int
	public let episode: Int?
	public let parameters: EpisodeQueryParameters
	public var endpoint: Endpoint { .init("episode/by-season/\(season)/\(episode.flatMap { String($0) } ?? "all")", .get) }

	public init(season: Int, episode: Int?, parameters: EpisodeQueryParameters) {
		self.season = season
		self.episode = episode
		self.parameters = parameters
	}
}

public struct GetEpisodesByAuthor: EpisodeQueryEndpoint {
	public let author: String
	public let parameters: EpisodeQueryParameters
	public var endpoint: Endpoint { .init("episode/by-author/\(author)", .get) }

	public init(author: String, parameters: EpisodeQueryParameters) {
		self.author = author
		self.parameters = parameters
	}
}

public struct EpisodeQueryParameters: Encodable {
	public let limit: Int?
	public let offset: Int?
	public let line: LineType?
	public let image: ImageType?
	public let date: DateType?
	public let song: SongType?

	public init(limit: Int? = nil, offset: Int? = nil, line: LineType? = nil, image: ImageType? = nil, date: DateType? = nil, song: SongType? = nil) {
		self.limit = limit
		self.offset = offset
		self.line = line
		self.image = image
		self.date = date
		self.song = song
	}
}
