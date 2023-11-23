//
//  ContentView.swift
//  Pizza
//
//  Created by Nikita Tikhonov on 10.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var orders: [OrderItem] = testOrders
    @State private var showOrders = false
    
    var body: some View {
        VStack {
            HeaderView()
                .shadow(radius: 5)
            HStack {
                Text("Orders count \(orders.count)")
                    .foregroundStyle(.white)
                    .font(.title2)
                Spacer()
                Button(action: {
                    showOrders.toggle()
                }, label: {
                    Image(systemName: showOrders ? "cart" : "menucard").font(.title)
                })
                .foregroundStyle(.white)
            }
            
            if showOrders {
                OrderView(orders: $orders)
                    .cornerRadius(10)
            } else {
                MenuItemView()
                    .padding(5)
                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
                MenuView()
            }
            Spacer()
        }
        .background(.linearGradient(colors: [.cyan, .surf, .sky, .white], startPoint: .topLeading, endPoint: .bottom))
    }
}

#Preview {
    ContentView()
}

