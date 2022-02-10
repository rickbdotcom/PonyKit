//
//  PonyListCard.swift
//  PonyApp
//
//  Created by RICHARD BURGESS on 2/9/22.
//

import Foundation
import PonyKit
import SwiftUI

struct PonyListCard: View {
	let pony: Pony

	var body: some View {
		let url = pony.image?.first?.url ?? URL(stringLiteral: "https://picsum.photos/128")
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

			Text(pony.name)
		}
	}
}
