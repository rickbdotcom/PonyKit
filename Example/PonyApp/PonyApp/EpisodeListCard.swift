//
//  PonyListCard.swift
//  PonyApp
//
//  Created by RICHARD BURGESS on 2/9/22.
//

import Foundation
import PonyKit
import SwiftUI

struct EpisodeListCard: View {
	let episode: Episode.Full

	var body: some View {
		let url = episode.image.url
		return HStack {
			AsyncImage(
				url: url,
				content: { image in
					image.resizable()
						 .aspectRatio(contentMode: .fill)
						 .frame(width: 128, height: 128)
						 .clipped()
				},
				placeholder: {
					ProgressView()
				}
			)
			.frame(width: 128, height: 128)

			Text(episode.name)
		}
	}
}

struct EpisodeListCard_Previews: PreviewProvider {
	static var previews: some View {
		let episodes: Episodes = try! Bundle.main.decode(path: "episode_all")
		return EpisodeListCard(episode: episodes.data[0])
	}
}
