//
//  OrderRowView.swift
//  Pizza
//
//  Created by Nikita Tikhonov on 13.11.2023.
//

import SwiftUI

struct OrderRowView: View {
    @Binding var order: OrderItem
    var body: some View {
        VStack {
            HStack {
                Text(order.item.name)
                    .padding(.horizontal, 5)
                Spacer()
            }
            HStack(alignment: .firstTextBaseline) {
                Text(order.quantity, format: .number)
                Text(order.item.price, format: .currency(code:"EUR"))
                    .fontWeight(.semibold)
                Spacer()
                Text(order.extPrice, format: .currency(code:"EUR"))
                    .fontWeight(.semibold)
            }.padding(.horizontal, 5)
        }
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    OrderRowView(order: .constant(testOrderItem))
}
