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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//#Preview {
//    SearchView(
//        store: Store(initialState: SearchReducer.State()) {
//            SearchReducer()
//        }
//    )
//}
