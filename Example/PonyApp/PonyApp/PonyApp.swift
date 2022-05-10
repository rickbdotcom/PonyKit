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
	@StateObject private var state = PonyAppState()

	@State var error: Error?
	@State var activity: Bool = false

	var body: some Scene {
		WindowGroup {
			NavigationView {
				VStack {
					Picker("Data", selection: $state.selectedData.id) {
						ForEach(PonyAppState.PonyDataSelection.allCases) {
							Text($0.title)
						}
					}
					.pickerStyle(SegmentedPickerStyle())

					switch state.selectedData {
					case .character:
						PonyList(ponies: $state.ponies)
							.displayRefreshable(error: $error) {
								try await state.updatePonies()
							}
					case .episode:
						EpisodeList(episodes: $state.episodes)
							.displayRefreshable(error: $error) {
								try await state.updateEpisodes()
							}
					default:
						EmptyView()
					}
				}
				.navigationTitle("Ponies")
			}
			.displayTask(activity: $activity, error: $error) {
				async let ponies: Void = state.updatePonies()
				async let episodes: Void = state.updateEpisodes()
				_ = try await (ponies, episodes)

			}
			.activity($activity)
			.alert(error: $error)
		}
	}
}
