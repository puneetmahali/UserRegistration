//
//  RegistrationModel.swift
//  UserRegistration
//
//  Created by Puneet Personal on 13.05.20.
//  Copyright © 2020 Puneet Personal. All rights reserved.
//

import Foundation

struct RegistrationModel: Encodable {
    let userName: String
    let userEmail: String
    let userPassword: String
}
