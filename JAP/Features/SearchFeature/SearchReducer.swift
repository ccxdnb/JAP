//
//  SearchReducer.swift
//  JAP
//
//  Created by Joaquin Wilson on 16-07-24.
//

import ComposableArchitecture

@Reducer
struct SearchReducer {
    @Dependency(\.cardClient) var cardClient

    @ObservableState
    struct State: Equatable {
        var searchText = ""

        var results: [PokemonCard] = []
    }

    enum Action {
        case searchUpdated(String)
        case searchResponse(APIResponse<[PokemonCard]>)

        case fetchCard
        case fetchCardResponse(APIResponse<PokemonCard>)

    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .searchUpdated(text):
                state.searchText = text
                state.results = []
                return .none

            case let .searchResponse(response):
                state.results = response.data
                return .none

            case .fetchCard:
                state.results = []
                return .run { send in
                    do {
                        try await send(.fetchCardResponse(self.cardClient.fetchById("xy1-1")))
                    } catch {
                        print(error)
                    }
                }

            case let .fetchCardResponse(response):
                state.results = [response.data]
                return.none
            }
        }
    }
}
