//
//  MenuItemDetailedView.swift
//  iosFoodApp
//
//  Created by Femi Alaka on 17/03/2024.
//

import SwiftUI

struct MenuItemDetailedView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    let dish: Dish
    
    var body: some View {
        VStack {
            Spacer()
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .clipShape(Rectangle())
            .frame(minHeight: 150)
            .padding(.bottom, 15)
            Text(dish.title ?? "")
                .font(.subTitleFont())
                .foregroundColor(.primaryColor1)
                .padding(.bottom, 15)
            Text(dish.dishDescription ?? "")
                .font(.regularText())
                .padding(.bottom, 15)
            Text("$" + (dish.price ?? ""))
                .font(.menuDetailText())
                .foregroundColor(.primaryColor1)
                .monospaced()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct DetailItem_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemDetailedView(dish: PersistenceController.oneDish())
    }
}

