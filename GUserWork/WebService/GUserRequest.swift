//
//  GUserRequest.swift
//  GUserWork
//
//  Created by 蕭文安的M1 on 2023/3/8.
//

import Foundation
import Moya

extension GUser {
    
    static let provider = MoyaProvider<GUser>()
    
    static func request(_ target: GUser, completion: @escaping (Data)->()) {
        provider.request(target) { result in
            switch result {
                
            case .success(let response):
                completion(response.data)
                
            case .failure(_):
                break
            }
        }
    }
    
    static func lists(since: Int = 0, perPage: Int = 20, completion: @escaping ([GUserListData])->()) {
        provider.request(.list(since, perPage)) { result in
            switch result {
            case .success(let response):
                guard
                    let users = try? JSONDecoder().decode([GUserListData].self, from: response.data)
                else {
                    return
                }
                completion(users)

            case .failure(_):
                break
            }
        }
    }
    
    static func detail(_ login: String, completion: @escaping (GUserData)->()) {
        provider.request(.detail(login)) { result in
            switch result {
            case .success(let response):
                guard
                    let user = try? JSONDecoder().decode(GUserData.self, from: response.data)
                else {
                    return
                }
                completion(user)

            case .failure(_):
                break
            }
        }
    }
    
}
