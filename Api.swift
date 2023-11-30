//
//  Api.swift
//  cookie_recipe-2
//
//  Created by Mate B. Szep on 11/30/23.
//

import Foundation
import SwiftUI
struct Recipes: Hashable, Codable {
    let name: String
    let image: String
}

class ViewModel: ObservableObject {
    @Published var recipes: [Recipes] = []
    func fetch() {
        guard let url = URL(string: "https://api.edamam.com/api/recipes/v2") else { return
        }
        let task = URLSession.shared.dataTask(with: url){ data, _, error in guard let data = data, error == nil else{
            return
            
        }
            do {
                let Recipes = try JSONDecoder().decode([Recipes].self, from: data)
                DispatchQueue.main.async {
                    self.recipes = Recipes
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
