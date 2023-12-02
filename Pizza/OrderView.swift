//
//  OrderView.swift
//  Pizza
//
//  Created by Nikita Tikhonov on 13.11.2023.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var orderModel: OrderModel
    
    var body: some View {
        VStack {
                NavigationStack {
                    List($orderModel.orderItems) { $order in
                        NavigationLink(value: order) {
                            OrderRowView(order: $order)
                                .padding([.leading, .trailing, .bottom], 5)
                        }.navigationDestination(for: OrderItem.self, destination: {order in OrderDetailView(orderItem: $order, presentSheet: .constant(false), newOrder: .constant(false))})
                            .navigationTitle("Order")
                        
                    }
                }
                .padding(.top, 70)
            Button("Delete") {
                if !orderModel.orderItems.isEmpty {
                    orderModel.orderItems.removeLast()
                }
            }.padding(5).background(.regularMaterial, in: Capsule()).padding()
        }.background((Color("Surf")))
        
        
    }
}

#Preview {
    OrderView(orderModel: OrderModel())
}
