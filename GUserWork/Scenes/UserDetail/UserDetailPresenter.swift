//
//  UserDetailPresenter.swift
//  GUserWork
//  (VIPER Fixed 3.1)
//  Created by 蕭文安的M1 on 2023/3/9.
//  
//

import Foundation

// Class & Stored Property
class UserDetailPresenter {

    // MARK: Properties
    weak var view: UserDetailViewController?
    var interactor: UserDetailInteractor?
    var router: UserDetailRouter?
    var model: UserDetailViewModelProtocol?
}

// View -> Presenter
extension UserDetailPresenter {
    
    func getDetail() {
        interactor?.requestDetail()
    }
    
}

// Interactor -> Presenter
extension UserDetailPresenter {
    
}
