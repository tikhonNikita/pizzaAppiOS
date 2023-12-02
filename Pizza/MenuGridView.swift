//
//  MenuGridView.swift
//  Pizza
//
//  Created by Nikita Tikhonov on 28.11.2023.
//

import SwiftUI

struct MenuGridView: View {
    @State var menu: [MenuItem]
    @State private var favourites: [Int] = []
    
    @Binding var selectedItem: MenuItem
    let columnLayout = Array(repeating: GridItem(spacing: 15), count: 3)
    let favouriteLayout = Array(repeating: GridItem(spacing: 15), count: 5)
    
    func findItem(id: Int)->MenuItem {
        menu.first(where: {$0.id == id}) ?? noMenuItem
    }
    
    
    @Namespace private var nspace
    
    
    var body: some View {
        VStack {
            
            ScrollView {
                LazyVGrid(columns: favouriteLayout) {
                    ForEach(favourites, id: \.self) { id in
                        FavoriteTileView(menuItem: menu[id])
                            .matchedGeometryEffect(id: id, in: nspace)
                            .onTapGesture(count: 2) {
                                if let index = favourites.firstIndex(of: id) {
                                    favourites.remove(at: index)
                                }
                            }
                            .onTapGesture {
                                selectedItem = menu[id]
                            }
                    }
                }.padding()
                
                LazyVGrid(columns: columnLayout){
                    ForEach(menu) { item in
                        if !favourites.contains(item.id) {
                            MenuItemTileView (
                                 menuItem: item,
                                 seleted: item == selectedItem,
                                 action: {
                                     if selectedItem == $0 {
                                         selectedItem = noMenuItem
                                         return
                                     }
                                    selectedItem = $0
                                 },
                                 onLongPress: {
                                     favourites.append(item.id)
                                 }
                             )
                            .matchedGeometryEffect(id: item.id, in: nspace)
                        }

                    }

                }.padding()
            }
        } .animation(.easeInOut, value: favourites)
    }
}

#Preview {
    MenuGridView(menu: MenuModel().menu, selectedItem: .constant(noMenuItem))
}
