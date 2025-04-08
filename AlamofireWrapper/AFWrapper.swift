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
    
    @objc public func getAllUsers() async throws -> [UserModel] {
        try await withCheckedThrowingContinuation { continuation in
            AF.request("https://dummyjson.com/users", method: .get, parameters: nil, encoding: URLEncoding.default)
                .validate()
                .responseDecodable(of: UserResponse.self) { response in
                    switch response.result {
                    case .success(let userResponse):
                        continuation.resume(returning: userResponse.users)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
    
    @objc public func getBundleName() -> String {
        return Bundle.main.bundleIdentifier ?? "No Bundle Identifier Found"
    }
}
