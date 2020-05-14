//
//  ContentView.swift
//  UserRegistration
//
//  Created by Puneet Personal on 13.05.20.
//  Copyright © 2020 Puneet Personal. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Propertiers
    @State public var email = ""
    @State public var password = ""
    @State var tag: Int? = nil
    
    // MARK: - View
    var body: some View {
        NavigationView {
            VStack() {
                NavigationLink(destination: RegistrationView(), tag: 1, selection: $tag) {
                    EmptyView()
                }
                Text("Welcome!")
                    .font(.largeTitle).foregroundColor(Color.white)
                    .padding([.top, .bottom], 5)
                    .shadow(radius: 10.0, x: 20, y: 10)
                Text("Get the best from this app")
                    .font(.subheadline).foregroundColor(Color.white)
                .padding([.top, .bottom], 5)
                .shadow(radius: 10.0, x: 20, y: 10)
                
                Image("userImage")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10.0, x: 20, y: 10)
                    .padding(.bottom, 50)
                
                VStack(alignment: .leading, spacing: 15) {
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
                    self.onLoginBtn()
                }) {
                    Text("Sign In")
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
                    Text("Don't have an account? ")
                        Button(action: {
                            self.tag = 1
                        }) {
                            Text("Sign Up")
                            .bold()
                            .foregroundColor(.black)
                        }
                }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all))
        }
        
    }
    
    
    func onLoginBtn() {
        let login = LoginModel(login: email, password: password)
        APIManager.sharedInstance.userLogInAPI(login: login) {
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


extension Color {
    static var themeTextField: Color {
        return Color(red: 220.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, opacity: 1.0)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
