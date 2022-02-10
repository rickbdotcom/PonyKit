import EndpointKit
import Foundation

protocol EpisodeQueryEndpoint: APIEndpoint where Parameters == EpisodeQueryParameters, Response == Episodes {
}

struct GetAllEpisodes: EpisodeQueryEndpoint {
	let parameters: EpisodeQueryParameters
	let endpoint: Endpoint = "GET episode/all"
}

struct GetEpisodesById: EpisodeQueryEndpoint {
	let id: Int
	let parameters: EpisodeQueryParameters
	var endpoint: Endpoint { .init("episode/\(id)", .get) }
}

struct GetEpisodesByOverall: EpisodeQueryEndpoint {
	let overall: Int
	let parameters: EpisodeQueryParameters
	var endpoint: Endpoint { .init("episode/by-overall/\(overall)", .get) }
}

struct GetEpisodesBySeasonEpisode: EpisodeQueryEndpoint {
	let season: Int
	let episode: Int?
	let parameters: EpisodeQueryParameters
	var endpoint: Endpoint { .init("episode/by-season/\(season)/\(episode.flatMap { String($0) } ?? "all")", .get) }
}

struct GetEpisodesByAuthor: EpisodeQueryEndpoint {
	let author: String
	let parameters: EpisodeQueryParameters
	var endpoint: Endpoint { .init("episode/by-author/\(author)", .get) }
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
