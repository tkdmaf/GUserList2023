//
//  UserListCell.swift
//  GUserWork
//
//  Created by 蕭文安的M1 on 2023/3/8.
//

import UIKit
import SDWebImage

// TableCell Use Code(Not embed xib or storyboard)
class UserListCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:  reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    var loginCenterConstraint: NSLayoutConstraint!
    
    let avatarView: UIImageView = {
        let imageView = UIImageView(image: nil)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        return imageView
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return label
    }()
    
    let roleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 80).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor(hex: 0x3366DD)
        label.clipsToBounds = true
        label.layer.cornerRadius = 15
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 2, bottom: 5, right: 2))
    }
    
    func initialize() {
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
        self.contentView.layer.borderWidth = 1
        self.selectionStyle = .none
        self.addSubview(avatarView)
        self.addSubview(loginLabel)
        self.addSubview(roleLabel)
        avatarView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        avatarView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        loginLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 10).isActive = true
        loginLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        loginCenterConstraint = loginLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        loginCenterConstraint.isActive = true
        roleLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 10).isActive = true
        roleLabel.bottomAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 0).isActive = true
    }
    
    func configure() {
        avatarView.image = UIImage(named: "colaHeader")
        loginLabel.text = "可樂爺爺"
        roleLabel.text = "STAFF"
    }
    
    func configure(data: GUserListData?) {
        guard let data = data else {
            avatarView.image = nil
            loginLabel.text = nil
            roleLabel.text = nil
            roleLabel.isHidden = true
            return
        }
        avatarView.sd_setImage(with: URL(string: data.avatar_url))
        loginLabel.text = data.login
        roleLabel.text = data.site_admin ? "STAFF" : ""
        roleLabel.isHidden = !data.site_admin
        loginCenterConstraint.constant = data.site_admin ? -15 : 0
    }
    
    
    
}
