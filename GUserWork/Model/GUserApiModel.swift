//
//  GUserApiModel.swift
//  GUserWork
//
//  Created by 蕭文安的M1 on 2023/3/8.
//

import Foundation

struct GUserListData: Decodable {
    
    var login: String
    var id: Int
    var node_id: String
    var avatar_url: String
    var gravatar_id: String
    var url: String
    var html_url: String
    var followers_url: String
    var following_url: String
    var gists_url: String
    var starred_url: String
    var subscriptions_url: String
    var organizations_url: String
    var repos_url: String
    var events_url: String
    var received_events_url: String
    var type: String
    var site_admin: Bool
    
}

struct GUserData: Decodable {
    
    var login: String
    var id: Int
    var avatar_url: String?
    var name: String?
    var bio: String?
    var location: String?
    var blog: String?
    var type: String?
    var site_admin: Bool
    
}
