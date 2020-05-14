//
//  RegistrationView.swift
//  UserRegistration
//
//  Created by Puneet Personal on 13.05.20.
//  Copyright © 2020 Puneet Personal. All rights reserved.
//

import SwiftUI

struct RegistrationView: View {
    // MARK: - Propertiers
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State var tag: Int? = nil
    
    // MARK: - View
    var body: some View {
        NavigationView {
            VStack() {
                NavigationLink(destination: RegistrationView(), tag: 1, selection: $tag) {
                    EmptyView()
                }
                Image("userImage")
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10.0, x: 20, y: 10)
                .padding(.bottom, 50)
                
                VStack(alignment: .leading, spacing: 15) {
                    TextField("First Name", text: self.$firstName)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                    
                    TextField("Last Name", text: self.$lastName)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                    
                    TextField("Email", text: self.$email)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                    
                    SecureField("Password", text: self.$password)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }.padding([.leading, .trailing], 27.5)
                
                Button(action: {
                    self.onRegisterBtn()
                }) {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }.padding(.top, 50)
                
                Spacer()
                HStack(spacing: 0) {
                    Text("Already have an account? ")
                    
                        Button(action: {
                            self.tag = 1
                        }) {
                            Text("Sign In")
                            .bold()
                            .foregroundColor(.black)
                        }
                }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all))
        }.navigationBarTitle("SignUp")
        
    }
    func onRegisterBtn() {
        let register = RegistrationModel(name: firstName + lastName, email: email, password: password)
        APIManager.sharedInstance.userRegistartionAPI(register: register) {
            (isSuccess) in
            if isSuccess {
                let alert = UIAlertController()
                alert.title = "Alert"
                alert.message = "User Register Succesfully."
            }else {
                let alert = UIAlertController()
                alert.title = "Alert"
                alert.message = "Pease try again!"
                
            }
        }
    }
}
