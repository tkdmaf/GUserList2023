//
//  UserListViewController.swift
//  GUserWork
//  (VIPER Fixed 3.1)
//  Created by 蕭文安的M1 on 2023/3/8.
//  
//

import UIKit

class UserListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var presenter: UserListPresenter?
    var router: UserListRouter?
    var model: UserListViewModelProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        presenter?.getList()
    }
    
    func configure() {
        tableView.register(UserListCell.self, forCellReuseIdentifier: "UserList")
    }
    
    
}

extension UserListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.guserList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = model?.guserList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserList", for: indexPath) as! UserListCell
        cell.configure(data: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}

extension UserListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = model?.guserList[indexPath.row] else { return }
        let destination = UserDetailRouter.createModule()
        destination.model?.login = item.login
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard
            let model = model,
            model.isLoading == false,
            model.guserList.count - 1 == indexPath.row,
            model.guserList.count < 100,
            let lastUser = model.guserList.last
        else { return }
        print("Loading")
        model.isLoading = true
        self.presenter?.getList(since: lastUser.id)
    }
    
}

// Other Method
extension UserListViewController {
    
}
