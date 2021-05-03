import Combine
import Foundation

protocol PonyServiceProtocol {
	func allCharacters(query: CharacterQueryParameters?) -> AnyPublisher<[Pony], Error>
	func characters(byId: Int, query: CharacterQueryParameters?) -> AnyPublisher<[Pony], Error>
	func characters(byKind: String, query: CharacterQueryParameters?) -> AnyPublisher<[Pony], Error>
	func characters(byOccupation: String, query: CharacterQueryParameters?) -> AnyPublisher<[Pony], Error>
	func characters(byResidence: String, query: CharacterQueryParameters?) -> AnyPublisher<[Pony], Error>
}
