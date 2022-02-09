import Combine
import Foundation

public protocol PonyServiceProtocol {
	func allCharacters(query: CharacterQueryParameters?) async throws -> Ponies
	func characters(byId: Int, query: CharacterQueryParameters?) async throws -> Ponies
	func characters(byKind: String, query: CharacterQueryParameters?) async throws -> Ponies
	func characters(byOccupation: String, query: CharacterQueryParameters?) async throws -> Ponies
	func characters(byResidence: String, query: CharacterQueryParameters?) async throws -> Ponies
}
