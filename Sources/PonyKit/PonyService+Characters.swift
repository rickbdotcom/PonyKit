import Combine
import EndpointKit
import Foundation

public extension PonyService {

	func allCharacters(query: CharacterQueryParameters? = nil) -> AnyPublisher<[Pony], Error> {
		client.request(PonyAPI.GetAllCharacters(parameters: query ?? .init())).map {
			$0.data
		}.eraseToAnyPublisher()
	}

	func characters(byId id: Int, query: CharacterQueryParameters? = nil) -> AnyPublisher<[Pony], Error> {
		client.request(PonyAPI.GetCharactersById(id: id, parameters: query ?? .init())).map {
			$0.data
		}.eraseToAnyPublisher()
	}

	func characters(byKind kind: String, query: CharacterQueryParameters? = nil) -> AnyPublisher<[Pony], Error> {
		client.request(PonyAPI.GetCharactersByKind(kind: kind, parameters: query ?? .init())).map {
			$0.data
		}.eraseToAnyPublisher()
	}

	func characters(byOccupation occupation: String, query: CharacterQueryParameters? = nil) -> AnyPublisher<[Pony], Error> {
		client.request(PonyAPI.GetCharactersByOccupation(occupation: occupation, parameters: query ?? .init())).map {
			$0.data
		}.eraseToAnyPublisher()
	}

	func characters(byResidence residence: String, query: CharacterQueryParameters? = nil) -> AnyPublisher<[Pony], Error> {
		client.request(PonyAPI.GetCharactersByResidence(residence: residence, parameters: query ?? .init())).map {
			$0.data
		}.eraseToAnyPublisher()
	}
}
