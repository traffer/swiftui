//
//  SortBy.swift
//  LLDM
//
//  Created by Siarhei Rybakou on 6/2/26.
//  Copyright © 2026 Siarhei Rybakou. All rights reserved.
//

import Foundation

enum SortBy: String, CaseIterable, Identifiable {
    case mostPopular = "Most Popular"
    case price = "Price $-$$$"
    case alphabet = "A-Z"
    
    var id: Self { self }
}
