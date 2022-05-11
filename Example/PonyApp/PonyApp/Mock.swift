//
//  Mock.swift
//  PonyApp
//
//  Created by RICHARD BURGESS on 5/11/22.
//

import Foundation
import PonyKit
import EndpointKit

let mockPonyClient: MockAPIClient = {
	let client = MockAPIClient()
	client.registerMockEndpoint(withFilePath: Bundle.main.path(forResource: "character_all", ofType: "json")!, endpoint: GetAllCharacters(parameters: .init()))
	client.registerMockEndpoint(withFilePath: Bundle.main.path(forResource: "episode_all", ofType: "json")!, endpoint: GetAllEpisodes(parameters: .init()))
	return client
}()

let mockPonyService = PonyService(client: mockPonyClient)
