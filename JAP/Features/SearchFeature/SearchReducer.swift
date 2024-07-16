//
//  SearchReducer.swift
//  JAP
//
//  Created by Joaquin Wilson on 16-07-24.
//

import ComposableArchitecture

@Reducer
struct SearchReducer {

    @ObservableState
    struct State: Equatable {
        var searchText = ""

    }

    enum Action {
        case searchUpdated(String)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case let .searchUpdated(text):
                state.searchText = text
                return .none
            }
        }
    }
}
