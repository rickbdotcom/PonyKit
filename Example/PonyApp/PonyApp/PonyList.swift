//
//  PonyList.swift
//  PonyApp
//
//  Created by rickb on 2/8/22.
//

import PonyKit
import SwiftUI

struct PonyList: View {
	@Binding var ponies: [Pony]

	var body: some View {
		List(ponies) { pony in
			NavigationLink(destination: {
				PonyDetail(pony: pony)
			}, label: {
				PonyListCard(pony: pony)
			})
		}
	}
}
