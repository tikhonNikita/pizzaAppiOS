//
//  MenuItemTileView.swift
//  HuliPizza
//
//  Created by Steven Lipton on 11/2/22.
//

import SwiftUI

struct MenuItemTileView: View {
    var menuItem: MenuItem
    let seleted: Bool
    var action: (_ menuItem: MenuItem) -> Void
    let onLongPress: (() ->Void)?
    
    @GestureState private var isPressed = false
    @GestureState private var isPressedOpacity = false

    var body: some View {
        VStack {
            Group {
                if let image = UIImage(named: "\(menuItem.id)_sm") {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                } else {
                    Image("surfboard_lg")
                        .resizable()
                        .scaledToFit()
                }
            }
            Text(menuItem.name).font(.caption2)
                .padding(3)
        }
        .background(Color("Sky").opacity(0.5))
        .background(.regularMaterial)
        .cornerRadius(10)
        .shadow(color: seleted ? .red : .black,
                radius: seleted ? 5 : 3)
        .opacity(isPressedOpacity ? 0.5 : 1) // Change opacity based on press state
        .onTapGesture {
            action(menuItem)
        }
        .onLongPressGesture {
            onLongPress?()
        }
    }
}

struct MenuItemTileView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemTileView(menuItem: MenuModel().menu[0],
                         seleted: false,
                         action: {_ in }, onLongPress: nil)
    }
}
