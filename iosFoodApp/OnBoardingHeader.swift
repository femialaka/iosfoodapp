//
//  OnBoardingHeader.swift
//  iosFoodApp
//
//  Created by Femi Alaka on 17/03/2024.
//

import Foundation

import SwiftUI

struct OnBoardingHeader: View {
    
    var body: some View {
       
         
        VStack {
            Text("Let's get to know you")
                .foregroundColor(Color.primaryColor2)
                .font(.onboardingDisplayFont())
                .frame(maxWidth: .infinity, alignment: .center)
        }
            
        
    }
}

struct OnBoardingHeader_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingHeader()
            .padding()
            .background(Color.primaryColor1)
            .frame(maxWidth: .infinity, maxHeight: 240)
    }
}

