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
	@StateObject var state = PonyAppState()

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
							.refreshable {
								await state.updatePonies()
							}
					case .episode:
						EpisodeList(episodes: $state.episodes)
							.refreshable {
								await state.updateEpisodes()
							}
					default:
						EmptyView()
					}
				}
				.navigationTitle("Ponies")
			}
			.onAppear {
				Task {
					await state.updatePonies()
					await state.updateEpisodes()
				}
			}
			.alert(state.error?.localizedDescription ?? "", isPresented: $state.isShowingError) {
				Button("OK", role: .cancel) { }
			}
		}
	}
}
