import EndpointKit
import Foundation

public extension PonyService {

	func allCharacters(query: CharacterQueryParameters? = nil) async throws -> [Pony] {
		try await client.request(GetAllCharacters(parameters: query ?? .init())).data
	}

	func characters(byId id: Int, query: CharacterQueryParameters? = nil) async throws -> [Pony] {
		try await client.request(GetCharactersById(id: id, parameters: query ?? .init())).data
	}

	func characters(byKind kind: String, query: CharacterQueryParameters? = nil) async throws -> [Pony] {
		try await client.request(GetCharactersByKind(kind: kind, parameters: query ?? .init())).data
	}

	func characters(byOccupation occupation: String, query: CharacterQueryParameters? = nil) async throws -> [Pony] {
		try await client.request(GetCharactersByOccupation(occupation: occupation, parameters: query ?? .init())).data
	}

	func characters(byResidence residence: String, query: CharacterQueryParameters?) async throws -> [Pony] {
		try await client.request(GetCharactersByResidence(residence: residence, parameters: query ?? .init())).data
	}
}
