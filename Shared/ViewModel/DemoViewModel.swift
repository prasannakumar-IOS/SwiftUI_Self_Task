//
//  DemoViewModel.swift
//  prasannaSwiftUI
//
//  Created by Prasannakumar Manikandan on 03/02/22.
//

import SwiftUI


class DemoViewModel: ObservableObject {
    @Published var pokemonNameList: [Pokemon] = [
        Pokemon(id: 0, name: "Charmander", type: "Fire", color: .red),
        Pokemon(id: 1, name: "Squirtle", type: "Water", color: .blue),
        Pokemon(id: 2, name: "Bulbasaur", type: "Grass", color: .green),
        Pokemon(id: 3, name: "Pikachu", type: "Electric", color: .yellow),
    ]
}

struct Pokemon: Identifiable {
  var id: Int
  var name: String
  var type: String
  var color: Color
}
