//
//  Onboarding.swift
//  iosFoodApp
//
//  Created by Femi Alaka on 17/03/2024.
//

import SwiftUI

struct Onboarding: View {
    @StateObject private var viewModel = ViewModel()
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var phoneNumber = ""
    
    @State var isKeyboardVisible = false
    @State var contentOffset: CGSize = .zero
    
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Header()
                    OnBoardingHeader()
                        .padding()
                        .background(Color.primaryColor1)
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 30)
                    VStack {
                        //NavigationLink(destination: Home(), isActive: $isLoggedIn) { }
                        Text("First name")
                            .onboardingTextStyle()
                        TextField("First Name", text: $firstName)
                            .uiTextfieldStyle()
                        Text("Last name")
                            .onboardingTextStyle()
                        TextField("Last Name", text: $lastName)
                            .uiTextfieldStyle()
                        Text("E-mail")
                            .onboardingTextStyle()
                        TextField("E-mail", text: $email)
                            .uiTextfieldStyle()
                            .keyboardType(.emailAddress)
                    }
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                    .padding()
                    .navigationDestination(isPresented: $isLoggedIn) {
                        Home()
                    }
                    
                    if viewModel.errorMessageShow {
                        withAnimation() {
                            Text(viewModel.errorMessage)
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                        }
                    }
                    
                    Button("Register") {
                        if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber) {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                            firstName = ""
                            lastName = ""
                            email = ""
                            isLoggedIn = true
                        }
                    }
                    .buttonStyle(ButtonStyleYellowColorWide())
                    
                    Spacer()
                }
                .offset(y: contentOffset.height)
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
                    withAnimation {
                        let keyboardRect = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                        let keyboardHeight = keyboardRect.height
                        self.isKeyboardVisible = true
                        self.contentOffset = CGSize(width: 0, height: -keyboardHeight / 2 + 50)
                    }
                    
                }
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { notification in
                    withAnimation {
                        self.isKeyboardVisible = false
                        self.contentOffset = .zero
                    }
                }
            }
            .onAppear() {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
        }
        .navigationBarBackButtonHidden()
        
    }
    
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

