//
//  GUserProvider.swift
//  GUserWork
//
//  Created by 蕭文安的M1 on 2023/3/8.
//

import Foundation
import Moya

enum GUser {
    case list(Int, Int)
    case detail(String)
}

extension GUser: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
        switch self {
            
        case .list:
            return "users"
            
        case .detail(let login):
            return "users/\(login)"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        switch self {
        case .list(let since, let perPage):
            return .requestParameters(parameters: ["since": since, "per_page": perPage], encoding: URLEncoding.default)
            
        case .detail:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return [
            "Content-Type": "Application/json"
        ]
    }
    
    
}

