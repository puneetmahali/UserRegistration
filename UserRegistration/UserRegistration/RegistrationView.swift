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
                Text("Create Your Account!")
                    .font(.largeTitle).foregroundColor(Color.white)
                    .padding([.top, .bottom], 40)
                    .shadow(radius: 10.0, x: 20, y: 10)
                
                Image("userImage")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10.0, x: 20, y: 10)
                    .padding(.bottom, 50)
                
                VStack(alignment: .leading, spacing: 15) {
                    TextField("firstName", text: self.$firstName)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                    
                    TextField("lastName", text: self.$lastName)
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
                
                Button(action: {print("Puneet")}) {
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
                    Text("Already have an account? ")
                    
                        Button(action: {
                            self.tag = 1A
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
        }
        
    }
}
