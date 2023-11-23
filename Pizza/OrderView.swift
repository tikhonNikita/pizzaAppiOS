//
//  OrderView.swift
//  Pizza
//
//  Created by Nikita Tikhonov on 13.11.2023.
//

import SwiftUI

struct OrderView: View {
    @Binding var orders: [OrderItem]
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                ScrollView {
                    ForEach($orders) { order in
                        OrderRowView(order: order)
                            .padding([.leading, .trailing, .bottom], 5)
                        
                    }
                }
                .padding(.top, 70)
                HStack {
                    Text("Order Pizza")
                        .font(.title)
                    Spacer()
                    Image(systemName: orders.isEmpty ? "cart":"cart.circle.fill")
                    Text(59.99, format: .currency(code:"EUR"))
                        .fontWeight(.semibold)
                }
                .padding()
                .background(.ultraThinMaterial)
            }
            .padding()
            
            Button("Delete") {
                if !orders.isEmpty {
                    orders.removeLast()
                }
            }.padding(5).background(.regularMaterial, in: Capsule()).padding()
        }.background((Color("Surf")))
        
        
    }
}

#Preview {
    OrderView(orders: .constant(testOrders))
}
