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

    }

    enum Action {

    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
//            switch action {
//                
//            }

            return .none
        }
    }
}
