//
//  MenuItemView.swift
//  Pizza
//
//  Created by Nikita Tikhonov on 13.11.2023.
//

import SwiftUI

struct MenuItemView: View {
    
    @State private var isItemAdded: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Margherita Huli Pizza")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.ultraThickMaterial)
                    .padding(.leading)
                if let image = UIImage(named: "0_lg")  {
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
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sollicitudin odio dui, eu laoreet sem scelerisque ut. Nam sit amet nunc vel risus ultricies ultrices ut porta massa. Aenean nec arcu nec eros venenatis volutpat. Mauris at metus sed diam pulvinar commodo. Sed pretium mi enim, nec consectetur nisi ultrices.")
                        .font(.custom("Georgia", size: 18, relativeTo: .body))
                }
            }
            
            Button {
                isItemAdded.toggle()
            } label: {
                Spacer()
                Text(12.99, format: .currency(code: "EUR"))
                Image(systemName: isItemAdded ? "cart.badge.plus" : "cart.fill.badge.plus")
                Spacer()
            }
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
    MenuItemView()
}
