//
//  PonyApp.swift
//  PonyApp
//
//  Created by rickb on 11/20/21.
//

import PonyKit
import SwiftUI

@main
struct PonyApp: App {
	@StateObject private var appState = PonyAppState()

	@State private var selection: PonyDataSelection = .character
	@State private var error: Error?
	@State private var activity = false

	var body: some Scene {
		WindowGroup {
			NavigationView {
				PonyDataSelectionView(selectedData: $selection, ponies: $appState.ponies, episodes: $appState.episodes)
					.navigationTitle("Ponies")
					.environment(\.error, $error)
					.environment(\.activity, $activity)
					.environment(\.services, appState)
			}
			.displayTask(activity: $activity, error: $error) {
				async let ponies: Void = appState.updatePonies()
				async let episodes: Void = appState.updateEpisodes()
				_ = try await (ponies, episodes)
			}
			.activity($activity)
			.alert(error: $error)
		}
	}
}
