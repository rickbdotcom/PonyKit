import EndpointKit
import Foundation

extension PonyAPI {

	struct GetAllCharacters: PonyQueryEndpoint {
		let parameters: CharacterQueryParameters
		let endpoint: Endpoint = "GET character/all"
	}

	struct GetCharactersById: PonyQueryEndpoint {
		let id: Int
		let parameters: CharacterQueryParameters
		var endpoint: Endpoint { .init("character/\(id)", .get) }
	}

	struct GetCharactersByKind: PonyQueryEndpoint {
		let kind: String
		let parameters: CharacterQueryParameters
		var endpoint: Endpoint { .init("by-kind/\(kind)", .get) }
	}

	struct GetCharactersByOccupation: PonyQueryEndpoint {
		let occupation: String
		let parameters: CharacterQueryParameters
		var endpoint: Endpoint { .init("by-occupation/\(occupation)", .get) }
	}

	struct GetCharactersByResidence: PonyQueryEndpoint {
		let residence: String
		let parameters: CharacterQueryParameters
		var endpoint: Endpoint { .init("by-occupation/\(residence)", .get) }
	}
}

extension PonyAPI {

	struct PonyResponse: Decodable {
		let data: [Pony]
		let status: Int
		let warning: String?
		let error: String?
	}
}
