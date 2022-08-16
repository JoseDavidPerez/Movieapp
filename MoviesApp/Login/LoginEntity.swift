//
//  LoginEntity.swift
//  MoviesApp
//
//  Created by osx on 13/08/22.
//

import Foundation

struct NewRequestTokenRequest : Request {
    var url: String
    
    func params() -> [(key: String, value: String)] {
        return []
    }
    
    
}

struct LoginRequest : Request {
    var url: String
    var username : String
    var password : String
    var requestToken : String
    
    func params() -> [(key: String, value: String)] {
        return [
            (key: "username", value: username),
            (key: "password", value: password),
            (key: "request_token", value: requestToken)
            
        ]
    }
    
    
}
