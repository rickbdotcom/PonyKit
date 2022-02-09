import EndpointKit
import Foundation

public class PonyService: PonyServiceProtocol {
	let client: APIClient

	public static let `default` = PonyService(client: APIClient(baseURL: "https://ponyweb.ml/v1", mapApiError: PonyService.mapApiError))

	public init(client: APIClient) {
		self.client = client
	}
}

public extension PonyService {

	static func mapApiError(response: HTTPURLResponse, data: Data) -> Error? {
		if let error = try? JSONDecoder().decode(PonyApiError.self, from: data) {
			return error
		} else {
			return nil
		}
	}
}
