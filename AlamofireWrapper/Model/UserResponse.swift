//
//  UserResponse.swift
//  AlamofireWrapper
//
//  Created by Hariharan R S on 07/04/25.
//

import Foundation

public struct UserResponse: Codable {
    public let users: [UserModel]
    
    enum CodingKeys: String, CodingKey {
        case users
    }
}

@objc public class UserModel: NSObject, Codable {
    @objc public var id: Int = 0
    @objc public var firstName: String = ""
    @objc public var lastName: String = ""
    @objc public var age: Int = 0
    @objc public var gender: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case age
        case gender
    }
    
    @objc public override init() {
        self.id = 0
        self.firstName = ""
        self.lastName = ""
        self.age = 0
        self.gender = ""
    }
}
