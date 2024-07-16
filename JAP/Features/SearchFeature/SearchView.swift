//
//  SearchView.swift
//  JAP
//
//  Created by Joaquin Wilson on 16-07-24.
//

import SwiftUI
import ComposableArchitecture

struct SearchView: View {
    @Bindable var store: StoreOf<SearchReducer>

    var body: some View {
        NavigationStack {
            Text("Searching for \(store.state.searchText)")
        }
        .searchable(text: $store.searchText.sending(\.searchUpdated))
    }
}

#Preview {
    SearchView(
        store: Store(initialState: SearchReducer.State()) {
            SearchReducer()
        }
    )
}

