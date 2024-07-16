//
//  HomeView.swift
//  JAP
//
//  Created by Joaquin Wilson on 16-07-24.
//

import ComposableArchitecture
import SwiftUI

struct HomeView: View {
    let store: StoreOf<HomeReducer>

    var body: some View {
        TabView {
            SearchView(store: store.scope(state: \.searchTab, action: \.searchTab))
              .tabItem {
                Text("Search")
              }
        }
    }
}

//#Preview {
//    HomeView(
//    store: Store(initialState: HomeReducer.State()) {
//      HomeReducer()
//    }
//  )
//}
