//
//  MenuItemsOptionView.swift
//  LLDM
//
//  Created by Siarhei Rybakou on 6/2/26.
//  Copyright © 2026 Siarhei Rybakou. All rights reserved.
//

import SwiftUI
import Combine

struct MenuItemsOptionView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding private(set) var selectedCategories: Set<MenuCategory>
    @Binding private(set) var selectedSortOption: SortBy
    
    var body: some View {
        NavigationStack {
            List {
                Section("SELECTED CATEGORIES") {
                    ForEach(MenuCategory.allCases, id: \.self) { category in
                        Button {
                            toggleCategory(category)
                        } label: {
                            HStack {
                                Text(category.rawValue)
                                Spacer()
                                if selectedCategories.contains(category) {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(.blue)
                                        .fontWeight(.semibold)
                                }
                            }
                            .contentShape(.rect) // makes entire row clickable
                        }
                        .buttonStyle(.plain)
                    }
                }
                
                Section("SORT BY") {
                    Picker("Sort by", selection: _selectedSortOption) {
                        ForEach(SortBy.allCases) { sortOption in
                            Text(sortOption.rawValue)
                                .tag(sortOption)
                        }
                    }
                    .pickerStyle(.inline)
                    .labelsHidden()
                }
            }
            .navigationTitle("Filter")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done", role: .close, action: dismiss.callAsFunction)
                        .buttonStyle(.plain)
                        .foregroundStyle(.blue)
                        .padding(.horizontal)
                }
            }
        }
    }
    
    private func toggleCategory(_ category: MenuCategory) {
        if selectedCategories.contains(category) {
            selectedCategories.remove(category)
        } else {
            selectedCategories.insert(category)
        }
    }
}

#Preview {
    @Previewable @State
    var categories: Set<MenuCategory> = [.dessert]
    @Previewable @State
    var sortOption: SortBy = .alphabet
    
    MenuItemsOptionView(
        selectedCategories: $categories,
        selectedSortOption: $sortOption
    )
}
