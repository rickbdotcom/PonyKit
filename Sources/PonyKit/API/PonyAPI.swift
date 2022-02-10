// https://ponyweb.ml/

import EndpointKit
import Foundation

protocol CharacterQueryEndpoint: APIEndpoint where Parameters == CharacterQueryParameters, Response == Ponies {
}

protocol EpisodeQueryEndpoint: APIEndpoint where Parameters == EpisodeQueryParameters, Response == Episodes {
}

