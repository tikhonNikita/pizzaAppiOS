//
//  RatingsView.swift
//  Pizza
//
//  Created by Nikita Tikhonov on 16.11.2023.
//

import SwiftUI

struct RatingsView: View {
    var rating: Int
    private let maxRating = 6
    private let filledImageName = "fork.knife.circle.fill"
    private let emptyImageName = "circle"

    var body: some View {
        HStack(spacing: 3) {
            ForEach(1...maxRating, id: \.self) { index in
                Image(systemName: index <= validatedRating ? filledImageName : emptyImageName)
                    .foregroundColor(index <= validatedRating ? .yellow : .gray)
                    .accessibilityLabel("\(index <= validatedRating ? "Filled" : "Empty") Star")
            }
        }
    }

    private var validatedRating: Int {
        max(0, min(rating, maxRating))
    }
}

#Preview {
    RatingsView(rating: Int.random(in: 0...7))
}
