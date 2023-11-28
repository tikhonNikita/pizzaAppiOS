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
            ZStack(alignment: .top) {
                ScrollView {
                    ForEach($orderModel.orderItems) { order in
                        OrderRowView(order: order)
                            .padding([.leading, .trailing, .bottom], 5)
                        
                    }
                }
                .padding(.top, 70)
                HStack {
                    Text("Order Pizza")
                        .font(.title)
                    Spacer()
                }
                .padding()
                .background(.ultraThinMaterial)
            }
            .padding()
            
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
