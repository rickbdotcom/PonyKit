//
//  MainAppView.swift
//  PonyApp
//
//  Created by rickb on 5/10/22.
//

import Foundation
import SwiftUI
import PonyKit

struct MainAppView: View {
	@Binding var selectedData: PonyDataSelection
	@Binding var ponies: [Pony]
	@Binding var episodes: [Episode.Full]

	@Environment(\.services) var services
	@Environment(\.error) var error

	var body: some View {
		VStack {
			PonyDataPicker(selection: $selectedData)

			switch selectedData {
			case .character:
				PonyList(ponies: $ponies)
					.displayRefreshable(error: error) {
						try await services.updatePonies()
					}
			case .episode:
				EpisodeList(episodes: $episodes)
					.displayRefreshable(error: error) {
						try await services.updateEpisodes()
					}
			default:
				EmptyView()
			}
		}
	}
}
