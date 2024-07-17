//
//  CardClient.swift
//  JAP
//
//  Created by Joaquin Wilson on 17-07-24.
//

import ComposableArchitecture
import Foundation

struct CardClient {
    var fetchById: (String) async throws -> APIResponse<PokemonCard>
    var search: (String) async throws -> APIResponse<[PokemonCard]>
}

extension CardClient: DependencyKey {
    static let liveValue = Self(
        fetchById: { id in
            let (data, response) = try await URLSession.shared
                .data(from: APIEndpoints.cardById(id).getURL())

            do {
                let card = try JSONDecoder().decode(APIResponse<PokemonCard>.self, from: data)
                return card
            } catch {
                print("Failed to decode JSON: \(error)")
                throw APIError.decodeError
            }
        }, 
        search: { query in
            // TODO: Implement search logic by queries
            return APIResponse(data: [], page: 0, pageSize: 0, count: 0, totalCount: 0)
        }
    )
}

extension DependencyValues {
    var cardClient: CardClient {
        get { self[CardClient.self] }
        set { self[CardClient.self] = newValue }
    }
}





// MARK: Networking layer
// TODO: Move out
enum APIError: Error {
    case decodeError
    case invalidEndpointURL
}

struct APIResponse<T: Codable>: Codable {
    var data: T
    var page: Int?
    var pageSize: Int?
    var count: Int?
    var totalCount: Int?
}

enum APIEndpoints {
    case baseUrl
    case cardById(String)

    func getURL() throws -> URL {
        var urlString: String = ""
        switch self {
        case .baseUrl:
            urlString = "https://api.pokemontcg.io/v2/cards/"
        case .cardById(let id):
            urlString = "https://api.pokemontcg.io/v2/cards/\(id)"
        }
        guard let url = URL(string: urlString) else { throw APIError.invalidEndpointURL }

        return url
    }
}
