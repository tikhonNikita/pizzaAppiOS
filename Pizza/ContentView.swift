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
    @State private var showGridMenu = true
    
    var body: some View {
        TabView {
            VStack {
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light)
                StatusBarView(
                    showOrders: $showOrders,
                    showGridMenu: $showGridMenu
                )
                MenuView2(menu: menu)
//                if showGridMenu {
//                    ScrollView {
//                        MenuItemView(item: $selectedItem, orderModel: orderModel)
//                            .padding(5)
//                            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
//                        
//                        MenuGridView(menu: MenuModel().menu, selectedItem: $selectedItem)
//                    }
//                    
//                } else {
//                    MenuItemView(item: $selectedItem, orderModel: orderModel)
//                        .padding(5)
//                        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
//                    MenuView(menu: menu, selectedItem: $selectedItem)
//                }
            }
            .tabItem {
                Label("Menu", systemImage: "list.bullet")
            }
            VStack {
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light)
                StatusBarView(
                    showOrders: $showOrders,
                    showGridMenu: $showGridMenu
                )
                //                if showOrders {
                OrderView(orderModel: orderModel)
                    .cornerRadius(10)
            }
            .tabItem {
                Label("Order", systemImage: "cart")
            }
        }
        
        .background(.linearGradient(colors: [.cyan, .surf, .sky, .white], startPoint: .topLeading, endPoint: .bottom))
        .environmentObject(orderModel)
    }
}

#Preview {
    ContentView(menu: MenuModel().menu)
}

