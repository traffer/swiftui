//
//  MenuItemDetailView.swift
//  LLDM
//
//  Created by Siarhei Rybakou on 6/2/26.
//  Copyright © 2026 Siarhei Rybakou. All rights reserved.
//

import SwiftUI

struct MenuItemDetailView: View {
    let item: any MenuItemProtocol
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 73)
                
                LabeledContent("Price:", value: item.price, format: .currency(code: "USD"))
                LabeledContent("Ordered:", value: item.ordersCount, format: .number)
                
                if !item.ingredients.isEmpty {
                    LabeledContent("Ingredients:") {
                        ForEach(item.ingredients, id: \.self) { ingredient in
                            Text(ingredient.rawValue)
                                .textCase(.lowercase)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom)
            .labeledContentStyle(.vertical)
        }
        .navigationTitle(item.title)
    }
}

#Preview {
    let item = MenuItem(
        ingredients: Ingredient.random(),
        menuCategory: .food,
        ordersCount: 1000,
        price: 10.99,
        title: "Food 5"
    )
    NavigationStack {
        MenuItemDetailView(item: item)
    }
}
