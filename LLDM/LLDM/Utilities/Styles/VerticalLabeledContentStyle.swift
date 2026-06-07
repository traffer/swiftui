//
//  VerticalLabeledContentStyle.swift
//  LLDM
//
//  Created by Siarhei Rybakou on 6/3/26.
//  Copyright © 2026 Siarhei Rybakou. All rights reserved.
//


import SwiftUI

struct VerticalLabeledContentStyle: LabeledContentStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.label.bold()
            configuration.content
        }
    }
}

extension LabeledContentStyle where Self == VerticalLabeledContentStyle {
    static var vertical: Self {
        .init()
    }
}
