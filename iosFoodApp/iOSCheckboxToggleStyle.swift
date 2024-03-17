//
//  iOSCheckboxToggleStyle.swift
//  iosFoodApp
//
//  Created by Femi Alaka on 17/03/2024.
//

import SwiftUI

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        HStack {
            HStack {
                Button(action: {
                    configuration.isOn.toggle()
                }, label: {
                    HStack {
                        Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                        configuration.label
                    }
                    
                    
                })
            }
            Spacer()
        }
        .padding(.bottom, 12)
    }
}
