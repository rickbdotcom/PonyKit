//
//  PonyDataPicker.swift
//  PonyApp
//
//  Created by rickb on 5/10/22.
//

import Foundation
import SwiftUI

struct PonyDataPicker: View {
	@Binding var selection: PonyDataSelection

	var body: some View {
		Picker("Data", selection: $selection.id) {
			ForEach(PonyDataSelection.allCases) {
				Text($0.title)
			}
		}
		.pickerStyle(SegmentedPickerStyle())
	}
}

enum PonyDataSelection: Int {
	case character
	case episode
	case song
	case comics
}

extension PonyDataSelection: CaseIterable, Identifiable {

	var title: String {
		switch self {
		case .character:
			return "Character"
		case .episode:
			return "Episode"
		case .song:
			return "Song"
		case .comics:
			return "Comics"
		}
	}

	var id: Int {
		get {
			Self.allCases.firstIndex(of: self)!
		}
		set {
			self = Self.allCases[newValue]
		}
	}
}
