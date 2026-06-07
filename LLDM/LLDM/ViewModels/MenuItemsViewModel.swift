//
//  MenuItemsViewModel.swift
//  LLDM
//
//  Created by Siarhei Rybakou on 6/2/26.
//  Copyright © 2026 Siarhei Rybakou. All rights reserved.
//

import Combine
import Foundation

final class MenuItemsViewModel: ObservableObject {
    @Published private(set) var dessertMenuItems: [MenuItem] = []
    @Published private(set) var drinkMenuItems: [MenuItem] = []
    @Published private(set) var foodMenuItems: [MenuItem] = []
    
    @Published var categories: Set<MenuCategory> = [.food, .drink, .dessert]
    @Published var sorting: SortBy = .alphabet {
        didSet {
            applySorting()
        }
    }
    
    init() {
        setupMockData()
        applySorting()
    }
}

extension MenuItemsViewModel {
    private func applySorting() {
        let comparator = sortComparator()
        dessertMenuItems.sort(using: comparator)
        drinkMenuItems.sort(using: comparator)
        foodMenuItems.sort(using: comparator)
    }
    
    private func setupMockData() {
        // 12 Food Items
        foodMenuItems = (1...12)
            .map {
                MenuItem(
                    ingredients: Ingredient.random(),
                    menuCategory: .food,
                    ordersCount: .random(in: 0...1000),
                    price: .random(in: 10...25),
                    title: "Food \($0)"
                )
            }
        
        // 8 Drink Items
        drinkMenuItems = (1...8)
            .map {
                MenuItem(
                    ingredients: [],
                    menuCategory: .drink,
                    ordersCount: .random(in: 0...500),
                    price: .random(in: 5...12),
                    title: "Drink \($0)"
                )
            }
        
        // 4 Dessert Items
        dessertMenuItems = (1...4)
            .map {
                MenuItem(
                    ingredients: Ingredient.random(),
                    menuCategory: .drink,
                    ordersCount: .random(in: 0...300),
                    price: .random(in: 6...15),
                    title: "Dessert \($0)"
                )
            }
    }

    private func sortComparator() -> KeyPathComparator<MenuItem>  {
        switch sorting {
        case .mostPopular:
            KeyPathComparator(\.ordersCount, order: .reverse)
        case .price:
            KeyPathComparator(\.price)
        case .alphabet:
            KeyPathComparator(\.title)
        }
    }
}
