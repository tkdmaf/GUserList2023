//
//  UserDetailRouter.swift
//  GUserWork
//
//  Created by 蕭文安的M1 on 2023/3/9.
//  
//

// BaseViperRouter若用在其他的新專案中請自行實作protocol
// 或將專案中原有的BaseViewRouter複製過去。

import UIKit

class UserDetailRouter {
    
    weak var view: UserDetailViewController?
    
    // MARK: Static methods
    static func createModule() -> UserDetailViewController {
        
        let viewController = UserDetailViewController(nibName: "UserDetailViewController", bundle: nil)
        
        /// init Presenter
        let presenter: UserDetailPresenter = UserDetailPresenter()
        presenter.view = viewController
        
        /// init Interactor
        presenter.interactor = UserDetailInteractor()
        presenter.interactor?.presenter = presenter
        
        /// init Router
        presenter.router = UserDetailRouter()
        presenter.router?.view = viewController
        
        /// init Logic
        presenter.model = UserDetailViewModel()
        presenter.model?.view = viewController
        
        /// configure ViewController
        viewController.presenter = presenter
        viewController.router = presenter.router
        viewController.model = presenter.model
        
        return viewController
    }
    
}

// Router Methods
extension UserDetailRouter {
    
}
