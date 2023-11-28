//
//  ContentView.swift
//  Pizza
//
//  Created by Nikita Tikhonov on 10.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    var menu: [MenuItem]
    @StateObject var orderModel: OrderModel = OrderModel()
    @State private var showOrders = false
    @State private var selectedItem: MenuItem = noMenuItem
    
    var body: some View {
        VStack {
            HeaderView()
                .shadow(radius: 5)
                .environment(\.colorScheme, .light)
            StatusBarView(
            showOrders: $showOrders
            )
            if showOrders {
                OrderView(orderModel: orderModel)
                    .cornerRadius(10)
            } else {
                MenuItemView(item: $selectedItem, orderModel: orderModel)
                    .padding(5)
                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
                MenuView(menu: menu, selectedItem: $selectedItem)
            }
            Spacer()
        }
        .background(.linearGradient(colors: [.cyan, .surf, .sky, .white], startPoint: .topLeading, endPoint: .bottom))
        .environmentObject(orderModel)
    }
}

#Preview {
    ContentView(menu: MenuModel().menu)
}

