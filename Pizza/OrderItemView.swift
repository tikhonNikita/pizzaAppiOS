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
    @State var pizzaCrust: PizzaCrust
    @State private var name: String = ""
    @State private var comments: String = ""
    
    init(orderItem: Binding<OrderItem>) {
        self._orderItem = orderItem
        self.pizzaCrust = orderItem.item.crust.wrappedValue
    }
    
    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
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
            
            VStack {
                Text("comments")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                TextEditor(text: $comments)
            }.clipShape(RoundedRectangle(cornerRadius: 3)).shadow(radius:1)
            
            
            Spacer()
        }.padding()
    }
}

#Preview {
    OrderItemView(orderItem: .constant(testOrderItem))
}
