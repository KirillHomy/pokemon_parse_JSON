//
//  ApiManager.swift
//  pokemon_parse_JSON
//
//  Created by Kirill Khomytsevych on 15.04.2023.
//

import Foundation

class ApiManager {

    let urlString = "https://pokeapi.co/api/v2/pokemon/"

    static let shared = ApiManager()

    func retrievePokemons(success: @escaping ((PokemonList) -> Void), fail: @escaping (() -> Void)) {
        ServiceManager.shared.callService(urlString) { (responce: PokemonList) in
            success(responce)
        } fail: {
            fail()
        }

    }
}
