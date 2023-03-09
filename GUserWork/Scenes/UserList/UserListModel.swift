//
//  UserListModel.swift
//  GUserWork
//  (VIPER Fixed 3.1)
//  Created by 蕭文安的M1 on 2023/3/8.
//  
//

import UIKit

protocol UserListViewModelUIDelegate: AnyObject {
    var view: UserListViewController? {get set}
}

protocol UserListViewModelProtocol: UserListViewModelUIDelegate {
    var guserList: [GUserListData] {get set}
    var isLoading: Bool {get set}
}

class UserListViewModel: UserListViewModelProtocol {
    
    weak var view: UserListViewController?

    var guserList: [GUserListData] = [] {
        didSet {
            view?.tableView.reloadData()
        }
    }
    var isLoading: Bool = false
    
}

