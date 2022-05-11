import EndpointKit
import Foundation

public class PonyService: PonyServiceProtocol, ObservableObject {
	@Published var client: APIClientProtocol

	public static let `default` = PonyService(client: APIClient(baseURL: "https://ponyweb.ml/v1", mapApiError: PonyService.mapApiError))

	public init(client: APIClientProtocol) {
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
