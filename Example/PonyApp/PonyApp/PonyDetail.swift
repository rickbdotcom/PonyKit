//
//  File.swift
//  
//
//  Created by RICHARD BURGESS on 5/9/22.
//

import Foundation
import PonyKit
import SwiftUI

struct PonyDetail: View {
	let pony: Pony

	var body: some View {
		Text(pony.name)
	}
}
