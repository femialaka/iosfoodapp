import SwiftUI

struct UserProfile: View {
    @StateObject private var viewModel = ViewModel()
    
    @Environment(\.presentationMode) var presentation
    
    @State private var orderStatuses = true
    @State private var passwordChanges = true
    @State private var specialOffers = true
    @State private var newsletter = true
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    
    @State private var isLoggedOut = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 5) {
                VStack {
                    Text("Avatar")
                        .onboardingTextStyle()
                    HStack(spacing: 0) {
                        Image("profile-image-placeholder")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(maxHeight: 75)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Button("Change") { }
                            .buttonStyle(ButtonStylePrimaryColor1())
                        Button("Remove") { }
                            .buttonStyle(ButtonStylePrimaryColorReverse())
                        Spacer()
                    }
                }
                
                VStack{
                    Text("First name")
                        .onboardingTextStyle()
                    TextField("First Name", text: $firstName)
                }
                
                VStack {
                    Text("Last name")
                        .onboardingTextStyle()
                    TextField("Last Name", text: $lastName)
                    
                }
                
                VStack {
                    Text("E-mail")
                        .onboardingTextStyle()
                    TextField("E-mail", text: $email)
                        .keyboardType(.emailAddress)
                }
                
                VStack {
                    Text("Phone number")
                        .onboardingTextStyle()
                    TextField("Phone number", text: $phoneNumber)
                        .keyboardType(.default)
                }
            }
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            .padding()
            .navigationDestination(isPresented: $isLoggedOut) {
                Onboarding()
            }
            
           
            
            HStack {
                Text("Email notifications")
                    .font(.regularText())
                    .foregroundColor(.primaryColor1)
                
                Spacer()
            }
            .padding(.leading)
            VStack {
                Toggle("Order statuses", isOn: $orderStatuses).toggleStyle(iOSCheckboxToggleStyle())
                Toggle("Password changes", isOn: $passwordChanges).toggleStyle(iOSCheckboxToggleStyle())
                Toggle("Special offers", isOn: $specialOffers).toggleStyle(iOSCheckboxToggleStyle())
                Toggle("Newsletter", isOn: $newsletter).toggleStyle(iOSCheckboxToggleStyle())
            }
            .padding()
            .font(Font.leadText())
            .foregroundColor(.primaryColor1)
            
            Button("Log out") {
               logout()
            }
            .buttonStyle(ButtonStyleYellowColorWide())
            Spacer(minLength: 20)
            HStack {
                Button("Discard Changes") {
                    firstName = viewModel.firstName
                    lastName = viewModel.lastName
                    email = viewModel.email
               
                    self.presentation.wrappedValue.dismiss()
                }
                    .buttonStyle(ButtonStylePrimaryColorReverse())
                Button("Save changes") {
                    if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber) {
            
                        saveChanges()
                        
                        self.presentation.wrappedValue.dismiss()
                    }
                }
                    .buttonStyle(ButtonStylePrimaryColor1())
            }
            if viewModel.errorMessageShow {
                withAnimation() {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                }
            }
            
        }
        .onAppear {
            initValues()
           
        }
        .navigationTitle(Text("Personal information"))
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func logout() {
        UserDefaults.standard.set(false, forKey: kIsLoggedIn)
        UserDefaults.standard.set("", forKey: kFirstName)
        UserDefaults.standard.set("", forKey: kLastName)
        UserDefaults.standard.set("", forKey: kEmail)
        UserDefaults.standard.set("", forKey: kPhoneNumber)
        UserDefaults.standard.set(false, forKey: kOrderStatus)
        UserDefaults.standard.set(false, forKey: kPassword)
        UserDefaults.standard.set(false, forKey: kSpecialOffers)
        UserDefaults.standard.set(false, forKey: kNews)
        isLoggedOut = true
    }
    
    func saveChanges() {
        UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
        UserDefaults.standard.set(orderStatuses, forKey: kOrderStatus)
        UserDefaults.standard.set(passwordChanges, forKey: kPassword)
        UserDefaults.standard.set(specialOffers, forKey: kSpecialOffers)
        UserDefaults.standard.set(newsletter, forKey: kNews)
        UserDefaults.standard.set(firstName, forKey: kFirstName)
        UserDefaults.standard.set(lastName, forKey: kLastName)
        UserDefaults.standard.set(email, forKey: kEmail)
        
        print("saved changes =============")
    }
    
    func initValues() {
        orderStatuses = viewModel.orderStatuses
        passwordChanges = viewModel.passwordChanges
        firstName = viewModel.firstName
        lastName = viewModel.lastName
        email = viewModel.email
        phoneNumber = viewModel.phoneNumber
        specialOffers = viewModel.specialOffers
        newsletter = viewModel.newsletter
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
