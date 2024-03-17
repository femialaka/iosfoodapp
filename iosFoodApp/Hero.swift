//
//  Hero.swift
//  iosFoodApp
//
//  Created by Femi Alaka on 17/03/2024.
//

import Foundation
import SwiftUI

struct Hero: View {
    
    var body: some View {
        VStack {
            VStack {
                Text("Little Lemon")
                    .foregroundColor(Color.primaryColor2)
                    .font(.displayFont())
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Chicago")
                    .foregroundColor(.white)
                    .font(.subTitleFont())
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack {
                
                
                
                VStack {
                    
                    GeometryReader { geometry in
                        HStack {
                            Text("""
                     We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.
                     """)
                            .foregroundColor(.white)
                            .font(.leadText())
                            .frame(width: geometry.size.width * 0.7, height: 90)
                            Image("hero-image")
                                .resizable()
                                .aspectRatio( contentMode: .fill)
                                .frame(maxWidth: 120, maxHeight: 90)
                                .clipShape(Rectangle())
                                .cornerRadius(16)
                                .frame(width: geometry.size.width * 0.3, height: 90)
                        }
                    }
                    .padding(.bottom, 12)
                    .padding(.top, 0)
                }
            }
        }
    }
}

struct Hero_Previews: PreviewProvider {
    static var previews: some View {
        Hero()
            .padding()
            .background(Color.primaryColor1)
            
    }
}

