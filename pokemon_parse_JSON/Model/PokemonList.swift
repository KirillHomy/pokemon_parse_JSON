//
//  PokemonList.swift
//  pokemon_parse_JSON
//
//  Created by Kirill Khomytsevych on 15.04.2023.
//

import Foundation

class PokemonList: Decodable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [PokemonResults]?
}

class PokemonResults: Decodable {
    var name: String?
    var url: String?
}
