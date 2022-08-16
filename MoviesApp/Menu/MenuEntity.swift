//
//  MenuEntity.swift
//  MoviesApp
//
//  Created by osx on 15/08/22.
//

import Foundation

struct MoviesRequest : Request {
    var url: String
    
    func params() -> [(key: String, value: String)] {
        return []
    }
    
    
}
