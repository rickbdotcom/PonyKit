// https://ponyweb.ml/

import EndpointKit
import Foundation

protocol PonyQueryEndpoint: APIEndpoint where Parameters == CharacterQueryParameters, Response == Ponies {
}

public enum PonyAPI {
}
