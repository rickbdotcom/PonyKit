import Combine
import EndpointKit
import Foundation

public class PonyService: PonyServiceProtocol {
	let client: APIClient

	public static let `default` = PonyService(client: APIClient(baseURL: "https://ponyweb.ml/v1"))

	public init(client: APIClient) {
		self.client = client
	}
}
