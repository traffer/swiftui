//
//  MenuItemCardView.swift
//  LLDM
//
//  Created by Siarhei Rybakou on 6/2/26.
//  Copyright © 2026 Siarhei Rybakou. All rights reserved.
//

import SwiftUI

struct MenuItemCardView: View {
    let title: String
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(.black)
                .frame(height: 100)
            Text(title)
                .font(.caption)
                .foregroundStyle(.primary)
        }
    }
}

#Preview {
    MenuItemCardView(title: "Some Item")
}
