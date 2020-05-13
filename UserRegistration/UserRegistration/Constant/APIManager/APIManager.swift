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
    
    func userRegistartionAPI(register: RegistrationModel, completionHandler:
        @escaping (Bool) -> ()) {
        let headers: HTTPHeaders = [
        .contentType("application/json")
        ]
        
        AF.request(register_Url, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response {
            response in
            debugPrint(response)
            
            switch response.result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                    if response.response?.statusCode == 200 {
                        completionHandler(true)
                    }else {
                        completionHandler(false)
                    }
                    
                }catch {
                    print(error.localizedDescription)
                    completionHandler(false)
                }
            case.failure(let error):
                print(error.localizedDescription)
                completionHandler(false)
            }
            
        }
    }
    
    func userLogInAPI(login: LoginModel, completionHandler:
        @escaping (Bool) -> ()) {
        let headers: HTTPHeaders = [
        .contentType("application/json")
        ]
        
        AF.request(login_Url, method: .post, parameters: login, encoder: JSONParameterEncoder.default, headers: headers).response {
            response in
            debugPrint(response)
            
            switch response.result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                    if response.response?.statusCode == 200 {
                        completionHandler(true)
                    }else {
                        completionHandler(false)
                    }
                    
                }catch {
                    print(error.localizedDescription)
                    completionHandler(false)
                }
            case.failure(let error):
                print(error.localizedDescription)
                completionHandler(false)
            }
            
        }
    }
}
