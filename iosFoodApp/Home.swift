//
//  Home.swift
//  iosFoodApp
//
//  Created by Femi Alaka on 17/03/2024.
//

import SwiftUI

struct Home: View {
    
    var body: some View {
        ContentView()
            .navigationBarBackButtonHidden()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}

