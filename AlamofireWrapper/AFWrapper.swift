//
//  AFWrapper.swift
//  AlamofireWrapper
//
//  Created by Hariharan R S on 07/04/25.
//

import Foundation
import Alamofire

@objc public class AFWrapper: NSObject {
    
    @objc public override init() {
        super.init()
    }
    
    @objc public func getAllUsers() async throws -> NSArray {
        try await withCheckedThrowingContinuation { continuation in
            AF.request("https://dummyjson.com/users", method: .get, parameters: nil, encoding: URLEncoding.default)
                .validate()
                .responseDecodable(of: UserResponse.self) { response in
                    switch response.result {
                    case .success(let userResponse):
                        continuation.resume(returning: NSArray(array: userResponse.users))
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
    
    @objc public func getAllUsersWithCompletion(
       completion: @escaping ([UserModel]) -> Void,
       failure: @escaping (Error) -> Void
    ) {
        AF.request("https://dummyjson.com/users", method: .get, parameters: nil, encoding: URLEncoding.default)
           .validate()
           .responseDecodable(of: UserResponse.self) { response in
               switch response.result {
               case .success(let userResponse):
                   completion(userResponse.users)
               case .failure(let error):
                   failure(error)
               }
           }
    }
}
