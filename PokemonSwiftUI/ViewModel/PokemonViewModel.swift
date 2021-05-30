//
//  PokemonViewModel.swift
//  PokemonSwiftUI
//
//  Created by Giuliano Soria Pazos on 2021-05-29.
//

import SwiftUI

final class PokemonViewModel: ObservableObject {
  @Published var pokemon: [Pokemon] = []
  let baseURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
  
  init() {
    fetchPokemon()
  }
  
  func fetchPokemon() {
    guard let url = URL(string: baseURL) else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data?.parseData(removeString: "null,") else { return }
      guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
      
      DispatchQueue.main.async { self.pokemon = pokemon }
    }
    .resume()
  }
  
  func backgrounColor(type: String) -> UIColor {
    switch Pokemon.PokemonType(rawValue: type) {
    case .fire:
      return .systemRed
    case .poison:
      return .systemGreen
    case .water:
      return .systemTeal
    case .electric:
      return .systemYellow
    case .psychic:
      return .systemPurple
    case .normal:
      return .systemOrange
    case .ground:
      return .systemGray
    case .flying:
      return .systemBlue
    case .fairy:
      return .systemPink
    default:
      return .systemIndigo
    }
  }
}

extension Data {
  func parseData(removeString string: String) -> Data? {
    let dataString = String(data: self, encoding: .utf8)
    let parsedDataString = dataString?.replacingOccurrences(of: string, with: "")
    
    guard let data = parsedDataString?.data(using: .utf8) else { return nil }
    
    return data
  }
}
