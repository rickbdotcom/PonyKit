//
//  PonyAppState.swift
//  PonyApp
//
//  Created by rickb on 2/8/22.
//

import Combine
import Foundation
import SwiftUI

protocol Services {
	func updatePonies() async throws
	func updateEpisodes() async throws
}

struct EmptyServices: Services {
	func updatePonies() async throws { }
	func updateEpisodes() async throws { }
}

private struct ServicesKey: EnvironmentKey {
	static let defaultValue: Services = EmptyServices()
}

extension EnvironmentValues {
	var services: Services {
		get { self[ServicesKey.self] }
		set { self[ServicesKey.self] = newValue }
	}
}
