import EndpointKit
import Foundation

public extension PonyService {

	func allCharacters(query: CharacterQueryParameters? = nil) async throws -> Ponies {
		try await client.request(PonyAPI.GetAllCharacters(parameters: query ?? .init()))
	}

	func characters(byId id: Int, query: CharacterQueryParameters? = nil) async throws -> Ponies {
		try await client.request(PonyAPI.GetCharactersById(id: id, parameters: query ?? .init()))
	}

	func characters(byKind kind: String, query: CharacterQueryParameters? = nil) async throws -> Ponies {
		try await client.request(PonyAPI.GetCharactersByKind(kind: kind, parameters: query ?? .init()))
	}

	func characters(byOccupation occupation: String, query: CharacterQueryParameters? = nil) async throws -> Ponies {
		try await client.request(PonyAPI.GetCharactersByOccupation(occupation: occupation, parameters: query ?? .init()))
	}

	func characters(byResidence residence: String, query: CharacterQueryParameters?) async throws -> Ponies {
		try await client.request(PonyAPI.GetCharactersByResidence(residence: residence, parameters: query ?? .init()))
	}
}
