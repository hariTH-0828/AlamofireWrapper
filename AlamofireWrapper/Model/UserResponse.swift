//
//  UserResponse.swift
//  ZIAMCryptWrapper
//
//  Created by Hariharan R S on 07/04/25.
//

import Foundation

public struct UserResponse: Codable {
    public let users: [UserModel]
    
    enum CodingKeys: String, CodingKey {
        case users = "users"
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
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        super.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        age = try container.decode(Int.self, forKey: .age)
        gender = try container.decode(String.self, forKey: .gender)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(age, forKey: .age)
        try container.encode(gender, forKey: .gender)
    }
}
