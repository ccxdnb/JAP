//
//  HomeReducer.swift
//  JAP
//
//  Created by Joaquin Wilson on 16-07-24.
//

import ComposableArchitecture

@Reducer
struct HomeReducer {
    
    struct State: Equatable {
        var searchTab = SearchReducer.State()
    }

    enum Action {
        case searchTab(SearchReducer.Action)
    }

    var body: some ReducerOf<Self> {
        Scope(state: \.searchTab, action: \.searchTab) {
            SearchReducer()
        }
        Reduce { state, action in
            // Core logic of the app feature
            return .none
        }
    }
}
