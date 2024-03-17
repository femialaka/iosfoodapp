//
//  ContentView.swift
//  iosFoodApp
//
//  Created by Femi Alaka on 17/03/2024.
//

import SwiftUI

struct ContentView: View {
        @Environment(\.managedObjectContext) private var viewContext
        
        var body: some View {
            NavigationStack {
                VStack {
                    Header()
                    Menu()
                }
            }
        }
    }

    struct MainScreen_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
        }
    }
