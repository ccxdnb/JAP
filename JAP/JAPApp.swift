//
//  JAPApp.swift
//  JAP
//
//  Created by Joaquin Wilson on 16-07-24.
//

import SwiftUI
import ComposableArchitecture

@main
struct JAPApp: App {
    static let store = Store(initialState: HomeReducer.State()) {
        HomeReducer()
            ._printChanges()
    }

    var body: some Scene {
        WindowGroup {
            HomeView(
                store: JAPApp.store
            )
        }
    }
}
