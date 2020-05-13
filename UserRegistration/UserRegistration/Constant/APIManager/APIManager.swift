//
//  APIManager.swift
//  UserRegistration
//
//  Created by Puneet Personal on 13.05.20.
//  Copyright © 2020 Puneet Personal. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    static let sharedInstance = APIManager()
    
    func userRegistartionAPI(register: RegistrationModel) {
        let headers: HTTPHeaders = [
        .contentType("application/json")
        ]
        
        AF.request(register_Url, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response {
            response in
            debugPrint(response)
        }
    }
}
