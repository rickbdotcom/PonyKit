import EndpointKit
import Foundation


struct GetAllCharacters: CharacterQueryEndpoint {
	let parameters: CharacterQueryParameters
	let endpoint: Endpoint = "GET character/all"
}

struct GetCharactersById: CharacterQueryEndpoint {
	let id: Int
	let parameters: CharacterQueryParameters
	var endpoint: Endpoint { .init("character/\(id)", .get) }
}

struct GetCharactersByKind: CharacterQueryEndpoint {
	let kind: String
	let parameters: CharacterQueryParameters
	var endpoint: Endpoint { .init("by-kind/\(kind)", .get) }
}

struct GetCharactersByOccupation: CharacterQueryEndpoint {
	let occupation: String
	let parameters: CharacterQueryParameters
	var endpoint: Endpoint { .init("by-occupation/\(occupation)", .get) }
}

struct GetCharactersByResidence: CharacterQueryEndpoint {
	let residence: String
	let parameters: CharacterQueryParameters
	var endpoint: Endpoint { .init("by-occupation/\(residence)", .get) }
}

public struct CharacterQueryParameters: Encodable {
	public let limit: Int?
	public let offset: Int?
	public let line: LineType?
	public let kind: KindType?
	public let image: ImageType?

	public init(limit: Int? = nil, offset: Int? = nil, line: LineType? = nil, kind: KindType? = nil, image: ImageType? = nil) {
		self.limit = limit
		self.offset = offset
		self.line = line
		self.kind = kind
		self.image = image
	}
}
