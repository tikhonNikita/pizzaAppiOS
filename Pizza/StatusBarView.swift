//
//  StatusBarView.swift
//  Pizza
//
//  Created by Nikita Tikhonov on 24.11.2023.
//

import SwiftUI

struct StatusBarView: View {
    @EnvironmentObject var orderModel: OrderModel
    @Binding var showOrders: Bool
    @Binding var showGridMenu: Bool
    var body: some View {
        HStack(alignment: .center) {
            Text("Count \(orderModel.orderCount)")
                .foregroundStyle(.white)
                .font(.title2)
            Spacer()
            Button(action: {
                showOrders.toggle()
            }, label: {
                Image(systemName: showOrders ? "cart" : "menucard").font(.title)
            })
            .foregroundStyle(.white)
            Button(action: {
                showGridMenu.toggle()
            }, label: {
                Image(systemName: showGridMenu ? "list.bullet" : "square.grid.3x2").font(.title)
            })
            .foregroundStyle(.white)
            Spacer()
            Text(orderModel.orderTotal, format: .currency(code:"EUR"))
                .font(.title2)
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 5)
        .background(.blue)
    }
}

#Preview {
    StatusBarView(
        showOrders: .constant(false),
        showGridMenu: .constant(false)
    ).environmentObject(OrderModel())
}
