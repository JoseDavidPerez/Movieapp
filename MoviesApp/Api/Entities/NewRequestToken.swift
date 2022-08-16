//
//  Newrequesttoken.swift
//  MoviesApp
//
//  Created by osx on 14/08/22.
//

import Foundation

struct NewRequestToken : Codable {
    
    let success : Bool
    let expiresAt: String
    let requestToken: String
    
    private enum CodingKeys : String , CodingKey {
        
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
        
    }
    
}
