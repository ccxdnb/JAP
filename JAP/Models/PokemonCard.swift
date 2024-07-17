//
//  PokemonCard.swift
//  JAP
//
//  Created by Joaquin Wilson on 16-07-24.
//

import Foundation

// MARK: - PokemonCard
struct PokemonCard: Codable, Equatable, Identifiable {
    let id: String?
    let name: String?
    let supertype: String?
    let subtypes: [String]?
    let hp: String?
    let types: [String]?
    let evolvesFrom: String?
    let abilities: [Ability]?
    let attacks: [Attack]?
    let weaknesses: [Weakness]?
    let retreatCost: [String]?
    let convertedRetreatCost: Int?
    let set: SetInfo?
    let number: String?
    let artist: String?
    let rarity: String?
    let flavorText: String?
    let nationalPokedexNumbers: [Int]?
    let legalities: Legalities?
    let images: CardImages?
    let tcgplayer: TCGPlayer?
    let cardmarket: CardMarket?
}

// MARK: - Ability
struct Ability: Codable, Equatable {
    let name: String?
    let text: String?
    let type: String?
}

// MARK: - Attack
struct Attack: Codable, Equatable {
    let name: String?
    let cost: [String]?
    let convertedEnergyCost: Int?
    let damage: String?
    let text: String?
}

// MARK: - Weakness
struct Weakness: Codable, Equatable {
    let type: String?
    let value: String?
}

// MARK: - SetInfo
struct SetInfo: Codable, Equatable {
    let id: String?
    let name: String?
    let series: String?
    let printedTotal: Int?
    let total: Int?
    let legalities: Legalities?
    let ptcgoCode: String?
    let releaseDate: String?
    let updatedAt: String?
    let images: SetImages?
}

// MARK: - Legalities
struct Legalities: Codable, Equatable {
    let unlimited: String?
    let standard: String?
    let expanded: String?
}

// MARK: - SetImages
struct SetImages: Codable, Equatable {
    let symbol: URL?
    let logo: URL?
}

// MARK: - CardImages
struct CardImages: Codable, Equatable {
    let small: URL?
    let large: URL?
}

// MARK: - TCGPlayer
struct TCGPlayer: Codable, Equatable {
    let url: URL?
    let updatedAt: String?
    let prices: TCGPlayerPrices?
}

// MARK: - TCGPlayerPrices
struct TCGPlayerPrices: Codable, Equatable {
    let normal: Price?
    let reverseHolofoil: Price?
}

// MARK: - Price
struct Price: Codable, Equatable {
    let low: Double?
    let mid: Double?
    let high: Double?
    let market: Double?
    let directLow: Double?
}

// MARK: - CardMarket
struct CardMarket: Codable, Equatable {
    let url: URL?
    let updatedAt: String?
    let prices: CardMarketPrices?
}

// MARK: - CardMarketPrices
struct CardMarketPrices: Codable, Equatable {
    let averageSellPrice: Double?
    let lowPrice: Double?
    let trendPrice: Double?
    let germanProLow: Double?
    let suggestedPrice: Double?
    let reverseHoloSell: Double?
    let reverseHoloLow: Double?
    let reverseHoloTrend: Double?
    let lowPriceExPlus: Double?
    let avg1: Double?
    let avg7: Double?
    let avg30: Double?
    let reverseHoloAvg1: Double?
    let reverseHoloAvg7: Double?
    let reverseHoloAvg30: Double?
}
