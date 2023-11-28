//
//  MenuItemView.swift
//  Pizza
//
//  Created by Nikita Tikhonov on 13.11.2023.
//

import SwiftUI

struct MenuItemView: View {
    
    @State private var isItemAdded: Bool = false
    @Binding var item: MenuItem
    @ObservedObject var orderModel: OrderModel
    
    var body: some View {
        VStack {
            HStack {
                Text(item.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.ultraThickMaterial)
                    .padding(.leading)
                if let image = UIImage(named: "\(item.id)_lg")  {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .padding([.top, .bottom], 5)
                        .font(.largeTitle)
                        .cornerRadius(15)
                    //                    .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    Image("surfboard_lg")
                        .resizable()
                        .scaledToFit()
                        .rotationEffect(.degrees(180))
                }
            }
            .background(.linearGradient(colors: [.surf, .sky.opacity(0.1)], startPoint: .leading, endPoint: .trailing), in:Capsule())
            .shadow(color: .teal, radius: 15, x: 8, y:8)
            
            VStack(alignment: .leading) {
                ScrollView {
                    Text(item.description)
                        .font(.custom("Georgia", size: 18, relativeTo: .body))
                }
            }
            
            Button {
                orderModel.addOrder(item, quantity: 1)
            } label: {
                Spacer()
                Text(item.price, format: .currency(code: "EUR"))
                Image(systemName: isItemAdded ? "cart.badge.plus" : "cart.fill.badge.plus")
                Spacer()
            }
            .disabled(item.id < 0)
            .padding(4)
            .font(.body)
            .fontWeight(.semibold)
            .background(.red)
            .foregroundStyle(.white)
            .shadow(radius: 5)
            .cornerRadius(5)
            .frame(maxWidth: .infinity)
            
        }
    }
}

#Preview {
    MenuItemView(item: .constant(testMenuItem),
                 orderModel: OrderModel())
}
