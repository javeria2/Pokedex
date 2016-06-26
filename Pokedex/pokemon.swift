//
//  pokemon.swift
//  Pokedex
//
//  Created by Sanchay  Javeria on 6/25/16.
//  Copyright © 2016 SanchayJaveria. All rights reserved.
//

import Foundation

/* create pokemon class and initializer */
class Pokemon {
    private var pokemonName: String!
    private var pokemonId: Int!
    private var pokemonHeight: String!
    private var pokemonWeight: String!
    private var pokemonDefence: String!
    private var pokemonAttack: String!
    private var pokemonType: String!
    private var pokemonDescription: String!
    private var Evolution: String!
    
    var name: String {
        return pokemonName
    }
    
    var id: Int{
        return pokemonId
    }
    
    init(name: String, id: Int) {
        pokemonName = name
        pokemonId = id
    }
}