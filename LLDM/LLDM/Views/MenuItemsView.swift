//
//  MenuItemsView.swift
//  LLDM
//
//  Created by Siarhei Rybakou on 6/2/26.
//  Copyright © 2026 Siarhei Rybakou. All rights reserved.
//

import SwiftUI

struct MenuItemsView: View {
    @StateObject private var viewModel = MenuItemsViewModel()
    @State private var showingOptions: Bool = false
    
    private var columns: [GridItem] = [
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible()),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, alignment: .leading) {
                    section(for: .food, with: viewModel.foodMenuItems)
                    section(for: .drink, with: viewModel.drinkMenuItems)
                    section(for: .dessert, with: viewModel.dessertMenuItems)
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingOptions = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(.blue)
                    .padding(.horizontal)
                }
            }
            .sheet(isPresented: $showingOptions) {
                MenuItemsOptionView(
                    selectedCategories: $viewModel.categories,
                    selectedSortOption: $viewModel.sorting
                )
            }
            .navigationDestination(for: MenuItem.self, destination: MenuItemDetailView.init)
        }
    }
    
    private func section(for category: MenuCategory, with items: [MenuItem]) -> some View {
        guard viewModel.categories.contains(category) else {
            return AnyView(EmptyView())
        }
        return AnyView(Section(category.rawValue) {
            ForEach(items) { item in
                NavigationLink(value: item) {
                    MenuItemCardView(title: item.title)
                }
            }
        })
    }
}

#Preview {
    MenuItemsView()
}
