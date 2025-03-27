//
//  UserModel.swift
//  Project-15.1-SwiftUI-challenge-remember-me
//
//  Created by Kevin Cuadros on 26/03/25.
//

import Foundation
import SwiftData

@Model
class User: Comparable {

    var id = UUID()
    var name: String
    var photo: Data
    var address: String
    
    init(id: UUID = UUID(), name: String, photo: Data, address: String) {
        self.id = id
        self.name = name
        self.photo = photo
        self.address = address
    }
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.name == rhs.name
    }
    
}
