//
//  UserDetailViewController.swift
//  GUserWork
//  (VIPER Fixed 3.1)
//  Created by 蕭文安的M1 on 2023/3/9.
//  
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var bioStack: UIStackView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var staffLabel: UILabel!
    
    // MARK: - Properties
    var presenter: UserDetailPresenter?
    var router: UserDetailRouter?
    var model: UserDetailViewModelProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        self.presenter?.getDetail()
        // or
        //self.presenter?.interactor?.requestDetail()
    }
    
    func configuration() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(targetLink(_:)))
        linkLabel.isUserInteractionEnabled = true
        linkLabel.addGestureRecognizer(tap)
    }
    
    
    @IBAction func closeTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

// Other Method
extension UserDetailViewController {
    
    @objc func targetLink(_ sender: UITapGestureRecognizer) {
        let shared = UIApplication.shared
        guard
            let link = model?.user?.blog,
            let url = URL(string: link),
            shared.canOpenURL(url)
        else {
            return
        }
        shared.open(url)
    }
    
    
}
