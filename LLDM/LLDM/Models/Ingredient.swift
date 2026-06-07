//
//  Ingredient.swift
//  LLDM
//
//  Created by Siarhei Rybakou on 6/2/26.
//  Copyright © 2026 Siarhei Rybakou. All rights reserved.
//

import Foundation

enum Ingredient: String, CaseIterable {
    case spinach = "Spinach"
    case broccoli = "Broccoli"
    case carrot = "Carrot"
    case pasta = "Pasta"
    case tomatoSauce = "Tomato sauce"
    
    static func random(_ maxLength: Int = allCases.count) -> [Self] {
        let allIngredients = allCases.shuffled()
        let upperBound = min(maxLength, allIngredients.count)
        let desiredNumberOfIngredients = Int.random(in: 1...upperBound)
        let ingredients = allIngredients.prefix(desiredNumberOfIngredients)
        return Array(ingredients)
    }
}
