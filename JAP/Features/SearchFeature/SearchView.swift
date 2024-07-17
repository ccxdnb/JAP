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
            ScrollView {
                LazyVStack() {
                    ForEach(store.results) { card in
                        VStack { //TODO: Create card view
                            Text(card.name ?? "")
                            AsyncImage(url: card.images?.small)
                                .scaledToFill()
                        }
                        .padding()
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
                        .border(.black, width: 1)
                    }
                    Spacer()
                }
                .padding()
            }
        }
        .searchable(text: $store.searchText.sending(\.searchUpdated))
        .task {
            store.send(.fetchCard)
        }
    }
}

#Preview {
    SearchView(
        store: Store(initialState: SearchReducer.State()) {
            SearchReducer()
        }
    )
}

