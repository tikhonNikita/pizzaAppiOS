//
//  MenuRowView.swift
//  Pizza
//
//  Created by Nikita Tikhonov on 13.11.2023.
//

import SwiftUI

struct MenuRowView: View {
    var item: MenuItem
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            if let image = UIImage(named: "\(item.id)_sm")  {
                Image(uiImage: image).font(.largeTitle)
                    .clipShape(Circle())
                    .padding(.trailing, -25)
                    .padding(.leading, -15)
            } else {
                Image("surfboard_sm")
            }
            VStack(alignment: .leading) {
                HStack {
                    Text(item.name)
                    Spacer()
                    Text(item.price, format: .currency(code: "EUR"))
                }
                RatingsView(rating: item.rating)
            }
            Spacer()
            
        }
    }
}

#Preview {
    MenuRowView(item: testMenuItem)
}
