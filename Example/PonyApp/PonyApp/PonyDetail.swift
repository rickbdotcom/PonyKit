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

struct PonyDetail_Previews: PreviewProvider {
	static var previews: some View {
		let ponies: Ponies = try! Bundle.main.decode(path: "character_all")
		return PonyDetail(pony: ponies.data[0])
	}
}
