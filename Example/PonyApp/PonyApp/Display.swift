//
//  Task.swift
//  PonyApp
//
//  Created by RICHARD BURGESS on 5/10/22.
//

import Foundation
import SwiftUI


func taskDisplay(activity: Binding<Bool>? = nil, error errorBinding: Binding<Error?>? = nil, _ action: () async throws -> Void) async {
	activity?.wrappedValue = true
	do {
		try await action()
		errorBinding?.wrappedValue = nil
		activity?.wrappedValue = false
	} catch {
		errorBinding?.wrappedValue = error
		activity?.wrappedValue = false
	}
}

func taskDisplay(activity: Binding<Bool>, _ action: () async -> Void) async {
	activity.wrappedValue = true
	await action()
	activity.wrappedValue = false
}

extension View {

	func displayTask(activity: Binding<Bool>? = nil, error errorBinding: Binding<Error?>? = nil, priority: TaskPriority = .userInitiated, _ action: @escaping @Sendable () async throws -> Void) -> some View {
		task(priority: priority) {
			await taskDisplay(activity: activity, error: errorBinding) {
				try await action()
			}
		}
	}

	func displayTask(activity: Binding<Bool>, priority: TaskPriority = .userInitiated, _ action: @escaping @Sendable () async -> Void) -> some View {
		task(priority: priority) {
			await taskDisplay(activity: activity) {
				await action()
			}
		}
	}

	func displayTask<T: Equatable>(id value: T, activity: Binding<Bool>? = nil, error errorBinding: Binding<Error?>? = nil, priority: TaskPriority = .userInitiated, _ action: @escaping @Sendable () async throws -> Void) -> some View {
		task(id: value, priority: priority) {
			await taskDisplay(activity: activity, error: errorBinding) {
				try await action()
			}
		}
	}

	func displayTask<T: Equatable>(id value: T, activity: Binding<Bool>, priority: TaskPriority = .userInitiated, _ action: @escaping @Sendable () async -> Void) -> some View {
		task(id: value, priority: priority) {
			await taskDisplay(activity: activity) {
				await action()
			}
		}
	}
}

extension View {

	func displayRefreshable(activity: Binding<Bool>? = nil, error: Binding<Error?>? = nil, _ action: @escaping @Sendable () async throws -> Void) -> some View {
		refreshable {
			await taskDisplay(activity: activity, error: error, action)
		}
	}

	func displayRefreshable(activity: Binding<Bool>, _ action: @escaping @Sendable () async -> Void) -> some View {
		refreshable {
			await taskDisplay(activity: activity, action)
		}
	}
}

extension View {

	func activity(_ activity: Binding<Bool>) -> some View {
		overlay {
			if activity.wrappedValue {
				ProgressView()
					.frame(maxWidth: .infinity, maxHeight: .infinity)
					.background(Color.black.opacity(0.50))
			} else {
				EmptyView()
			}
		}
	}
}


extension View {

	public func alert(error: Binding<Error?>) -> some View {
		alert(error.wrappedValue?.localizedDescription ?? "", isPresented: error.errorAlertPresented) {
			Button("OK", role: .cancel) { }
		}
	}
}

extension Binding where Value == Error? {
	var errorAlertPresented: Binding<Bool> {
		Binding<Bool>(get: {
			wrappedValue != nil
		}, set: {
			if $0 == false {
				wrappedValue = nil
			}
		})
	}
}
