import EndpointKit
import Foundation

public protocol CharacterQueryEndpoint: APIEndpoint, Equatable where Parameters == CharacterQueryParameters, Response == Ponies {
}

public struct GetAllCharacters: CharacterQueryEndpoint {
	public init(parameters: CharacterQueryParameters) {
		self.parameters = parameters
	}

	public let parameters: CharacterQueryParameters
	public let endpoint: Endpoint = "GET character/all"
}

public struct GetCharactersById: CharacterQueryEndpoint {
	public let id: Int
	public let parameters: CharacterQueryParameters
	public var endpoint: Endpoint { .init("character/\(id)", .get) }
}

public struct GetCharactersByKind: CharacterQueryEndpoint {
	public let kind: String
	public let parameters: CharacterQueryParameters
	public var endpoint: Endpoint { .init("by-kind/\(kind)", .get) }
}

public struct GetCharactersByOccupation: CharacterQueryEndpoint {
	public let occupation: String
	public let parameters: CharacterQueryParameters
	public var endpoint: Endpoint { .init("by-occupation/\(occupation)", .get) }
}

public struct GetCharactersByResidence: CharacterQueryEndpoint {
	public let residence: String
	public let parameters: CharacterQueryParameters
	public var endpoint: Endpoint { .init("by-occupation/\(residence)", .get) }
}

public struct CharacterQueryParameters: Encodable, Equatable {
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
