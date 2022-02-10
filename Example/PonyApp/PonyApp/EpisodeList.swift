//
//  PonyList.swift
//  PonyApp
//
//  Created by rickb on 2/8/22.
//

import PonyKit
import SwiftUI

struct EpisodeList: View {
	@Binding var episodes: [Episode.Full]

	var body: some View {
		List(episodes) { episode in
			EpisodeListCard(episode: episode)
		}
	}
}
