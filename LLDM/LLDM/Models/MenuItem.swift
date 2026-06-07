//
//  MenuItem.swift
//  LLDM
//
//  Created by Siarhei Rybakou on 6/2/26.
//  Copyright © 2026 Siarhei Rybakou. All rights reserved.
//

import Foundation

protocol MenuItemProtocol: Identifiable {
    var id: UUID { get }
    var ingredients: [Ingredient] { get set }
    var menuCategory: MenuCategory { get }
    var ordersCount: Int { get set }
    var price: Double { get }
    var title: String { get }
}

struct MenuItem: MenuItemProtocol, Hashable {
    let id: UUID = .init()
    var ingredients: [Ingredient]
    let menuCategory: MenuCategory
    var ordersCount: Int
    let price: Double
    let title: String
}
