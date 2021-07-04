import Combine
import Foundation

public protocol PonyServiceProtocol {
	func allCharacters(query: CharacterQueryParameters?) -> AnyPublisher<Ponies, Error>
	func characters(byId: Int, query: CharacterQueryParameters?) -> AnyPublisher<Ponies, Error>
	func characters(byKind: String, query: CharacterQueryParameters?) -> AnyPublisher<Ponies, Error>
	func characters(byOccupation: String, query: CharacterQueryParameters?) -> AnyPublisher<Ponies, Error>
	func characters(byResidence: String, query: CharacterQueryParameters?) -> AnyPublisher<Ponies, Error>
#if swift(>=5.5)
	@available(macOS 12.0, iOS 15.0, watchOS 8.0, tvOS 15.0, *)
	func allCharacters(query: CharacterQueryParameters?) async throws -> Ponies
	@available(macOS 12.0, iOS 15.0, watchOS 8.0, tvOS 15.0, *)
	func characters(byId: Int, query: CharacterQueryParameters?) async throws -> Ponies
	@available(macOS 12.0, iOS 15.0, watchOS 8.0, tvOS 15.0, *)
	func characters(byKind: String, query: CharacterQueryParameters?) async throws -> Ponies
	@available(macOS 12.0, iOS 15.0, watchOS 8.0, tvOS 15.0, *)
	func characters(byOccupation: String, query: CharacterQueryParameters?) async throws -> Ponies
	@available(macOS 12.0, iOS 15.0, watchOS 8.0, tvOS 15.0, *)
	func characters(byResidence: String, query: CharacterQueryParameters?) async throws -> Ponies
#endif
}
