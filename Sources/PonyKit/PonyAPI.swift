// https://ponyweb.ml/

import EndpointKit
import Foundation

protocol PonyQueryEndpoint: APIEndpoint where Parameters == CharacterQueryParameters, Response == PonyAPI.PonyResponse {
}

public enum PonyAPI {
}
