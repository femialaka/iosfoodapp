//
//  ViewModel.swift
//  iosFoodApp
//
//  Created by Femi Alaka on 17/03/2024.
//

import Foundation
import Combine

public let kFirstName = "FIRSTNAME"
public let kLastName = "LASTNAME"
public let kPhoneNumber = "PHONE"
public let kEmail = "EMAIL"
public let kOrderStatus = "ORDER_STATUS"
public let kPassword = "PASSWORD"
public let kSpecialOffers = "OFFER"
public let kNews = "NEWS"
public let kIsLoggedIn = "kIsLoggedIn"


class ViewModel: ObservableObject {
    
    @Published var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @Published var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @Published var orderStatuses = UserDefaults.standard.bool(forKey: kOrderStatus)
    @Published var passwordChanges = UserDefaults.standard.bool(forKey: kPassword)
    @Published var specialOffers = UserDefaults.standard.bool(forKey: kSpecialOffers)
    @Published var newsletter = UserDefaults.standard.bool(forKey: kNews)
    @Published var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @Published var phoneNumber = UserDefaults.standard.string(forKey: kPhoneNumber) ?? ""
    @Published var errorMessageShow = false
    @Published var errorMessage = ""
    @Published var searchText = ""
    
    func validateUserInput(firstName: String, lastName: String, email: String, phoneNumber: String) -> Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            errorMessage = "All fields are required"
            errorMessageShow = true
            return false
        }
        
        guard email.contains("@") else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        
        let email = email.split(separator: "@")
        
        guard email.count == 2 else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        
        guard email[1].contains(".") else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        guard phoneNumber.first == "+" && phoneNumber.dropFirst().allSatisfy({$0.isNumber}) || phoneNumber.isEmpty else {
            errorMessage = "Invalid phone number format."
            errorMessageShow = true
            return false
        }
        errorMessageShow = false
        errorMessage = ""
        return true
    }
}
