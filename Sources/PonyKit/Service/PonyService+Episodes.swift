import EndpointKit
import Foundation

public extension PonyService {

	func allEpisodes(query: EpisodeQueryParameters? = nil) async throws -> [Episode.Full] {
		try await client.request(GetAllEpisodes(parameters: query ?? .init())).data
	}

	func episodes(byId id: Int, query: EpisodeQueryParameters? = nil) async throws -> [Episode.Full] {
		try await client.request(GetEpisodesById(id: id, parameters: query ?? .init())).data
	}

	func episodes(byOverall overall: Int, query: EpisodeQueryParameters? = nil) async throws -> [Episode.Full] {
		try await client.request(GetEpisodesByOverall(overall: overall, parameters: query ?? .init())).data
	}

	func episodes(bySeason season: Int, episode: Int? = nil, query: EpisodeQueryParameters? = nil) async throws -> [Episode.Full] {
		try await client.request(GetEpisodesBySeasonEpisode(season: season, episode: episode, parameters: query ?? .init())).data
	}

	func episodes(byAuthor author: String, query: EpisodeQueryParameters? = nil) async throws -> [Episode.Full] {
		try await client.request(GetEpisodesByAuthor(author: author, parameters: query ?? .init())).data
	}
}
