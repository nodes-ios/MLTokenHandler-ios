//
//  File.swift
//  
//
//  Created by Jakob Mygind on 07/02/2023.
//

import Foundation

public struct RefreshBody: Encodable {
        
    public let token: String
    
    public init(token: String) {
        self.token = token
    }
}

