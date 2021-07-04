import Combine
import EndpointKit
import Foundation

public extension PonyService {

	func allCharacters(query: CharacterQueryParameters? = nil) -> AnyPublisher<Ponies, Error> {
		client.request(PonyAPI.GetAllCharacters(parameters: query ?? .init()))
	}

	func characters(byId id: Int, query: CharacterQueryParameters? = nil) -> AnyPublisher<Ponies, Error> {
		client.request(PonyAPI.GetCharactersById(id: id, parameters: query ?? .init()))
	}

	func characters(byKind kind: String, query: CharacterQueryParameters? = nil) -> AnyPublisher<Ponies, Error> {
		client.request(PonyAPI.GetCharactersByKind(kind: kind, parameters: query ?? .init()))
	}

	func characters(byOccupation occupation: String, query: CharacterQueryParameters? = nil) -> AnyPublisher<Ponies, Error> {
		client.request(PonyAPI.GetCharactersByOccupation(occupation: occupation, parameters: query ?? .init()))
	}

	func characters(byResidence residence: String, query: CharacterQueryParameters? = nil) -> AnyPublisher<Ponies, Error> {
		client.request(PonyAPI.GetCharactersByResidence(residence: residence, parameters: query ?? .init()))
	}
}


#if swift(>=5.5)
@available(macOS 12.0, iOS 15.0, watchOS 8.0, tvOS 15.0, *)
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
#endif
