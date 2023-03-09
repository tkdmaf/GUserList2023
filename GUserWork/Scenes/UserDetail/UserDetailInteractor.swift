//
//  UserDetailInteractor.swift
//  GUserWork
//  (VIPER Fixed 3.1)
//  Created by 蕭文安的M1 on 2023/3/9.
//  
//

import Foundation

class UserDetailInteractor {

    // MARK: Properties
    weak var presenter: UserDetailPresenter?
}

// MARK: Presenter To Interactor Method
extension UserDetailInteractor {
    
    func requestDetail() {
        guard let login = presenter?.model?.login else { return }
        GUser.detail(login) { [weak self] data in
            self?.presenter?.model?.user = data
        }
    }
    
}
