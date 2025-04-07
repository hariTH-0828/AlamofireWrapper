//
//  UserResponse.swift
//  AlamofireWrapper
//
//  Created by Hariharan R S on 07/04/25.
//

import Foundation

public struct UserResponse: Codable, Sendable {
    public let users: [UserModel]
    
    enum CodingKeys: String, CodingKey {
        case users
    }
}

public struct UserModel: Codable, Sendable {
    public var id: Int = 0
    public var firstName: String = ""
    public var lastName: String = ""
    public var age: Int = 0
    public var gender: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case age
        case gender
    }
}
