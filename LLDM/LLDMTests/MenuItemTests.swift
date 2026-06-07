//
//  MenuItemTests.swift
//  LLDMTests
//
//  Created by Siarhei Rybakou on 6/6/26.
//  Copyright © 2026 Siarhei Rybakou. All rights reserved.
//

import XCTest
@testable import LLDM

final class MenuItemTests: XCTestCase {
    /// Test menu item title, when initializing with a title, expect the menu item title to equal the initialized value.
    func testMenuItemTitle() throws {
        let expectedTitle = "Expected Title"
        let item = MenuItem(ingredients: [.tomatoSauce], menuCategory: .food, ordersCount: 1, price: 1.99, title: expectedTitle)
        XCTAssertEqual(item.title, expectedTitle, "Menu item title should match the initialized value.")
        
    }
    
    /// Test menu item ingredients, when initializing with ingredients, expect the menu item title to equal the initialized value.
    func testMenuItemIngredients() throws {
        let expectedIngredients: [Ingredient] = [.spinach, .broccoli]
        let item = MenuItem(ingredients: expectedIngredients, menuCategory: .food, ordersCount: 1, price: 1.99, title: "title")
        XCTAssertEqual(item.ingredients, expectedIngredients, "Menu item ingredients should match the initialized value.")
    }
}
