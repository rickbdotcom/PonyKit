//
//  PonyAppState.swift
//  PonyApp
//
//  Created by rickb on 5/11/22.
//

import Foundation
import PonyKit

@MainActor
class PonyAppState: Services, ObservableObject {

	@Published var ponyService = PonyService.default
	@Published var selectedData: PonyDataSelection = .character
	@Published var ponies: [Pony] = []
	@Published var episodes: [Episode.Full] = []

	func updatePonies() async throws {
		ponies = try await ponyService.allCharacters(query: nil)
	}

	func updateEpisodes() async throws {
		episodes = try await ponyService.allEpisodes(query: nil)
	}
}
