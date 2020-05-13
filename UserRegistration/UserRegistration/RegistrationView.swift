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







/*
struct RegistrationView : View {
    @State var tag: Int? = nil
    
    var body: some View {
     NavigationView {
        
        VStack {
            NavigationLink(destination: LoginView(), tag: 1, selection: $tag) {
                EmptyView()
            }
          List {
            HStack {
               Spacer()
               Image("userImage")
               .resizable()
               .frame(width: 250, height: 250)
               .clipShape(Circle())
               .overlay(Circle().stroke(Color.white, lineWidth: 4))
               .shadow(radius: 10.0, x: 20, y: 10)
               .listRowInsets(EdgeInsets())
               .padding(.horizontal)
               Spacer()
               }

           VStack(alignment: .leading) {
               LabelTextField(label: "Fisrt Name", placeHolder: "Enter Your First Name")
               LabelTextField(label: "Last Name", placeHolder: "Enter Your Last Name")
               LabelTextField(label: "Email", placeHolder: "Enter Your Email Id")
               LabelTextField(label: "Password", placeHolder: "Enter Your Password")
               //SecureField("Password", text: self.$password)
               LabelTextField(label: "PHONE", placeHolder: "Enter Your Phone Number")

            
            
           }
            HStack {
                Spacer()
                RoundedButton().padding([.top, .bottom], 20)
                Spacer()
            }
           .padding(.top, 20)
           .listRowInsets(EdgeInsets())
       }
            
        }
            .navigationBarTitle(Text("Create Your Account"))
            .navigationBarItems(trailing:
                    Button(action: {
                        self.tag = 1
                    
                    }, label: {
                        Text("Cancel")
                    })
            )
        }
 
    }
}


func onRegisterBtn() {
    
    let fname = LabelTextField.init(label: "Fisrt Name", placeHolder: "")
    
    let register = RegistrationModel(name: fname.label, email: "", password: "")
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



struct RoundedButton : View {
    var body: some View {
        Button(action: {
            print("Save Taped")
            onRegisterBtn()
        }) {
            HStack {
                Spacer()
                Text("Save")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .font(.headline)
        .foregroundColor(.white)
        .padding()
        .frame(width: 300, height: 50)
        .background(Color.green)
        .cornerRadius(15.0)
        .shadow(radius: 10.0, x: 20, y: 10)
    }
}

#if DEBUG
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RegistrationView().previewLayout(.fixed(width: 375, height: 1000))
            RoundedButton().previewLayout(.sizeThatFits)
        }
    }
}
#endif
*/
