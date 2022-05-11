//
//  PonyAppState.swift
//  PonyApp
//
//  Created by rickb on 2/8/22.
//

import Combine
import Foundation
import PonyKit
import SwiftUI

@MainActor
class Services: ObservableObject {
	@Published var ponyService = PonyService.default
	@Published var selectedData: PonyDataSelection = .character
	@Published var ponies: [Pony] = []
	@Published var episodes: [Episode.Full] = []

	func updatePonies() async throws {
		ponies = try await ponyService.allCharacters(query: nil)
	}

	func updateEpisodes() async throws{
		episodes = try await ponyService.allEpisodes(query: nil)
	}
}
