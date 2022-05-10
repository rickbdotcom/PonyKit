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
class PonyAppState: ObservableObject {
	let ponyService: PonyService = .default

	@Published var selectedData: PonyDataSelection = .character
	@Published var ponies: [Pony] = []
	@Published var episodes: [Episode.Full] = []

	enum PonyDataSelection: Int {
		case character
		case episode
		case song
		case comics
	}

	func updatePonies() async throws{
		ponies = try await ponyService.allCharacters(query: nil)
	}

	func updateEpisodes() async throws{
		episodes = try await ponyService.allEpisodes(query: nil)
	}
}

extension PonyAppState.PonyDataSelection: CaseIterable, Identifiable {

	var title: String {
		switch self {
		case .character:
			return "Character"
		case .episode:
			return "Episode"
		case .song:
			return "Song"
		case .comics:
			return "Comics"
		}
	}

	var id: Int {
		get {
			Self.allCases.firstIndex(of: self)!
		}
		set {
			self = Self.allCases[newValue]
		}
	}
}
