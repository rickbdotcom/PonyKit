import Combine
import Foundation

protocol PonyServiceProtocol {
	func allCharacters(query: CharacterQueryParameters?) -> AnyPublisher<Ponies, Error>
	func characters(byId: Int, query: CharacterQueryParameters?) -> AnyPublisher<Ponies, Error>
	func characters(byKind: String, query: CharacterQueryParameters?) -> AnyPublisher<Ponies, Error>
	func characters(byOccupation: String, query: CharacterQueryParameters?) -> AnyPublisher<Ponies, Error>
	func characters(byResidence: String, query: CharacterQueryParameters?) -> AnyPublisher<Ponies, Error>
}
