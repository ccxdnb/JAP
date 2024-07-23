//
//  CardClient.swift
//  JAP
//
//  Created by Joaquin Wilson on 17-07-24.
//

import ComposableArchitecture
import Foundation
import SwiftUI

struct CardClient {
    var fetchById: (String) async throws -> APIResponse<PokemonCard>
    var search: (SearchCondition) async throws -> APIResponse<[PokemonCard]>
}

extension CardClient: DependencyKey {
    static let liveValue = Self(
        fetchById: { id in
            try await NetworkLayer.process(.cardById(id))
        }, 
        search: { condition in
            try await NetworkLayer.process(.searchBy(condition))
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

struct NetworkLayer {
    static func process<T: Codable>(_ endpoint: APIEndpoints) async throws -> APIResponse<T> {
        let (data, response) = try await URLSession.shared.data(for: endpoint.request())

        do {
            let card = try JSONDecoder().decode(APIResponse<T>.self, from: data)
            return card
        } catch {
            print("Failed to decode JSON: \(error)")
            throw APIError.decodeError
        }
    }
}


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
    case searchBy(SearchCondition)

    var url: URL? {
        var urlString: String = ""
        switch self {
        case .baseUrl, .searchBy:
            urlString = "https://api.pokemontcg.io/v2/cards/"
        case let .cardById(id):
            urlString = "https://api.pokemontcg.io/v2/cards/\(id)"
        }
        return URL(string: urlString)
    }

    func request() throws -> URLRequest {
        guard let url = self.url else {
            throw APIError.invalidEndpointURL
        }

        var request = URLRequest(url: url)

        switch self {
        case .baseUrl, .cardById:
            break
        case .searchBy(let condition):
            request.url?.append(queryItems: [
                URLQueryItem(name: "q", value: condition.query)
            ])
        }
 // TODO: Add base param such as page, pagesize, etc
        return request
    }
}

struct SearchCondition {
    struct Field {
        var key: String
        var value: String
    }

    var fields: [Field] 

    var page: Int

    var query: String {
        self.fields.map { "\($0.key):\($0.value)" }.reduce("", { $0 + " \($1)"})
    }
}
