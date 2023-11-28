//
//  OrderItemView.swift
//  Pizza
//
//  Created by Nikita Tikhonov on 27.11.2023.
//

import SwiftUI

struct OrderItemView: View {
    
    @Binding var orderItem: OrderItem
    @State var quantity = 1
    @State var doubleIngredient = false
    @State private var pizzaCrust: PizzaCrust = .calzone
    var body: some View {
        VStack {
            Toggle(isOn: $doubleIngredient, label: {
                Text("Double Ingredients " + (doubleIngredient ? "Yes"
                     : "No")
                )
            })
            
            Stepper(value: $quantity, in: 1...10) {
                Text("\(quantity) " + (quantity == 1 ? "Pizza" : "Pizzas"))
            }
            
            Picker(selection: $pizzaCrust, content: {
                ForEach(PizzaCrust.allCases, id: \.self) { crust in
                    Text(crust.rawValue).tag(crust)
                }
            }, label: {
                Text("Pizza crust")
            })
            .pickerStyle(MenuPickerStyle())
            
            Spacer()
        }
    }
}

#Preview {
    OrderItemView(orderItem: .constant(testOrderItem))
}
