//
//  PonyAppState.swift
//  PonyApp
//
//  Created by rickb on 2/8/22.
//

import Combine
import Foundation
import PonyKit

class PonyAppState: ObservableObject {
	@Published var ponies: [Pony] = []
}
