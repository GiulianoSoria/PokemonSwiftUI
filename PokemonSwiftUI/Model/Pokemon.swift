//
//  Pokemon.swift
//  PokemonSwiftUI
//
//  Created by Giuliano Soria Pazos on 2021-05-29.
//

import Foundation

struct Pokemon: Codable, Identifiable {
  let id: Int
  let name: String
  let imageUrl: String
  let type: String
  
  enum PokemonType: String, CaseIterable {
    case fire = "fire"
    case poison = "poison"
    case water = "water"
    case electric = "electric"
    case psychic = "psychic"
    case normal = "normal"
    case ground = "ground"
    case flying = "flying"
    case fairy = "fairy"
  }
}

let mockPokemon: [Pokemon] = [
  .init(id: 0, name: "Bulbasaur", imageUrl: "1", type: "Poison"),
  .init(id: 1, name: "Ivysaur", imageUrl: "1", type: "Poison"),
  .init(id: 2, name: "Venasaur", imageUrl: "1", type: "Poison"),
  .init(id: 3, name: "Charmander", imageUrl: "1", type: "Fire"),
  .init(id: 4, name: "Charmeleon", imageUrl: "1", type: "Fire"),
  .init(id: 6, name: "Charizard", imageUrl: "1", type: "Fire")
]
