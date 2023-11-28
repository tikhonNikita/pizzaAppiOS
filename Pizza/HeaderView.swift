//
//  HeaderView.swift
//  Pizza
//
//  Created by Nikita Tikhonov on 13.11.2023.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var orderModel: OrderModel
    @Environment(\.verticalSizeClass) var vSizeClass: UserInterfaceSizeClass?
    
    
    var body: some View {
        VStack {
            if (vSizeClass ?? .regular) != .compact {
                ZStack(alignment: .bottomTrailing) {
                    Image("surfBanner")
                        .resizable()
                        .scaledToFit()
                    Text("Pizza Company")
                        .font(.custom("Georgia", size: 30, relativeTo: .title))
                        .foregroundStyle(.regularMaterial)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
            } else {
                HStack(alignment: .bottom, content: {
                    Image("surfBanner")
                        .resizable()
                        .scaledToFit()
                    Text("Pizza Company")
                        .font(.custom("Georgia", size: 30, relativeTo: .title))
                        .foregroundStyle(Color(.surf))
                        .fontWeight(.heavy)
                })
            }
        }
        .background(.ultraThinMaterial)
    }
}

#Preview {
    HeaderView().environmentObject(OrderModel())
}
