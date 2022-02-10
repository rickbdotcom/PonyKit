import Combine
import Foundation

public protocol PonyServiceProtocol {
	func allCharacters(query: CharacterQueryParameters?) async throws -> [Pony]
	func characters(byId: Int, query: CharacterQueryParameters?) async throws -> [Pony]
	func characters(byKind: String, query: CharacterQueryParameters?) async throws -> [Pony]
	func characters(byOccupation: String, query: CharacterQueryParameters?) async throws -> [Pony]
	func characters(byResidence: String, query: CharacterQueryParameters?) async throws -> [Pony]

	func allEpisodes(query: EpisodeQueryParameters?) async throws -> [Episode.Full]
	func episodes(byId id: Int, query: EpisodeQueryParameters?) async throws -> [Episode.Full]
	func episodes(byOverall overall: Int, query: EpisodeQueryParameters?) async throws -> [Episode.Full]
	func episodes(bySeason season: Int, episode: Int?, query: EpisodeQueryParameters?) async throws -> [Episode.Full]
	func episodes(byAuthor author: String, query: EpisodeQueryParameters?) async throws -> [Episode.Full]
}
