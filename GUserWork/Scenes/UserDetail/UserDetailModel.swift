//
//  UserDetailModel.swift
//  GUserWork
//  (VIPER Fixed 3.1)
//  Created by 蕭文安的M1 on 2023/3/9.
//  
//

import UIKit
import SDWebImage

protocol UserDetailViewModelUIDelegate: AnyObject {
    var view: UserDetailViewController? {get set}
}

protocol UserDetailViewModelProtocol: UserDetailViewModelUIDelegate {
    var login: String? {get set}
    var user: GUserData? {get set}
}

class UserDetailViewModel: UserDetailViewModelProtocol {
    
    weak var view: UserDetailViewController?

    var login: String?
    
    var user: GUserData? {
        didSet {
            guard let item = user else { return }
            if let avatar_url = item.avatar_url {
                view?.avatarImage.sd_setImage(with: URL(string: avatar_url))
            }
            if let bio = item.bio {
                view?.bioStack.isHidden = bio.isEmpty
                view?.bioLabel.text = bio
            }
            view?.nameLabel.text = item.name
            view?.loginLabel.text = item.login
            view?.staffLabel.isHidden = !item.site_admin
            view?.locationLabel.text = item.location
            view?.linkLabel.text = item.blog
        }
    }
}

