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

struct EpisodeList_Previews: PreviewProvider {
	static var previews: some View {
		let episodes: Episodes = try! Bundle.main.decode(path: "episode_all")
		return EpisodeList(episodes: .constant(episodes.data))
	}
}
