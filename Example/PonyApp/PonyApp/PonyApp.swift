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
	@StateObject private var services = Services()

	@State private var selection: PonyDataSelection = .character
	@State private var error: Error?
	@State private var activity = false

	var body: some Scene {
		WindowGroup {
			NavigationView {
				MainAppView(selectedData: $selection, ponies: $services.ponies, episodes: $services.episodes)
					.navigationTitle("Ponies")
					.environment(\.error, $error)
					.environment(\.activity, $activity)
					.environmentObject(services)
			}
			.displayTask(activity: $activity, error: $error) {
				async let ponies: Void = services.updatePonies()
				async let episodes: Void = services.updateEpisodes()
				_ = try await (ponies, episodes)
			}
			.activity($activity)
			.alert(error: $error)
		}
	}
}
