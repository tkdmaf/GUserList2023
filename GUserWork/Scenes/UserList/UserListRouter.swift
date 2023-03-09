//
//  UserListRouter.swift
//  GUserWork
//
//  Created by 蕭文安的M1 on 2023/3/8.
//  
//

// BaseViperRouter若用在其他的新專案中請自行實作protocol
// 或將專案中原有的BaseViewRouter複製過去。

import UIKit

class UserListRouter {
    
    weak var view: UserListViewController?
    
    // MARK: Static methods
    static func createModule() -> UserListViewController {
        
        let viewController = UserListViewController(nibName: "UserListViewController", bundle: nil)
        
        /// init Presenter
        let presenter: UserListPresenter = UserListPresenter()
        presenter.view = viewController
        
        /// init Interactor
        presenter.interactor = UserListInteractor()
        presenter.interactor?.presenter = presenter
        
        /// init Router
        presenter.router = UserListRouter()
        presenter.router?.view = viewController
        
        /// init Logic
        presenter.model = UserListViewModel()
        presenter.model?.view = viewController
        
        /// configure ViewController
        viewController.presenter = presenter
        viewController.router = presenter.router
        viewController.model = presenter.model
        
        return viewController
    }
    
}

// Router Methods
extension UserListRouter {
    
}
