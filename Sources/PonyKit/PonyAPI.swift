// https://ponyweb.ml/
import EndpointKit
import Foundation

protocol PonyQueryEndpoint: APIEndpoint where Parameters == PonyAPI.CharacterQueryParameters?, Response == PonyAPI.PonyResponse {
}

public enum PonyAPI {
}

extension PonyAPI {

	struct GetAllCharacters: PonyQueryEndpoint {
		let parameters: CharacterQueryParameters?
		let endpoint: Endpoint = "GET v1/character/all"
	}

	struct GetCharacterById: PonyQueryEndpoint {
		let id: Int
		let parameters: CharacterQueryParameters?
		var endpoint: Endpoint { .init("v1/character/\(id)", .get) }
	}

	struct GetCharacterByKind: PonyQueryEndpoint {
		let kind: String
		let parameters: CharacterQueryParameters?
		var endpoint: Endpoint { .init("v1/by-kind/\(kind)", .get) }
	}

	struct GetCharacterByOccupation: PonyQueryEndpoint {
		let occupation: String
		let parameters: CharacterQueryParameters?
		var endpoint: Endpoint { .init("v1/by-occupation/\(occupation)", .get) }
	}

	struct GetCharacterByResidence: PonyQueryEndpoint {
		let residence: String
		let parameters: CharacterQueryParameters?
		var endpoint: Endpoint { .init("v1/by-occupation/\(residence)", .get) }
	}
}

extension PonyAPI {

	struct CharacterQueryParameters: Encodable {
		let limit: Int?
		let offset: Int?
		let line: Line?
		let kind: Kind?
		let image: Image?

		enum Line: String, Encodable {
			case string, array
		}

		enum Kind: String, Encodable {
			case none, id, name, full
		}

		enum Image: String, Encodable {
			case none, id, url, full
		}
	}

	struct PonyResponse: Decodable {
		let data: [Pony]
	}

	struct Pony: Decodable {
		let id: Int
		let name: String
		let alias: String?
		let url: URL
		let sex: String?
		let residence: String?
		let occupation: String?
		let kind: [String]
		let image: [URL]
	}
}
