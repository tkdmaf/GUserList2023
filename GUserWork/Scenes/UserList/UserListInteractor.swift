//
//  UserListInteractor.swift
//  GUserWork
//  (VIPER Fixed 3.1)
//  Created by 蕭文安的M1 on 2023/3/8.
//  
//

import Foundation

class UserListInteractor {

    // MARK: Properties
    weak var presenter: UserListPresenter?
}

// MARK: Presenter To Interactor Method
extension UserListInteractor {
    
    func requestList(since: Int, perPage: Int) {
        GUser.lists(since: since) { [weak self] datas in
            self?.presenter?.model?.guserList += datas
            self?.presenter?.model?.isLoading = false
        }
    }
    
}
