//
//  UserListPresenter.swift
//  GUserWork
//  (VIPER Fixed 3.1)
//  Created by 蕭文安的M1 on 2023/3/8.
//  
//

import Foundation

// Class & Stored Property
class UserListPresenter {

    // MARK: Properties
    weak var view: UserListViewController?
    var interactor: UserListInteractor?
    var router: UserListRouter?
    var model: UserListViewModelProtocol?
}

// View -> Presenter
extension UserListPresenter {
    
    func getList(since: Int = 0, perPage: Int = 20) {
        interactor?.requestList(since: since, perPage: 20)
    }
    
    func readMore() {
        
    }
    
}

// Interactor -> Presenter
extension UserListPresenter {
    
}
