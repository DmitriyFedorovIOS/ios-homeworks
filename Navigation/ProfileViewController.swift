//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Fedorov Dmitry on 06.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 30))
        nameLabel.center = CGPoint(x: view.center.x, y: view.center.y)
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        nameLabel.textColor = .black
        nameLabel.backgroundColor = .systemBlue
        nameLabel.text = "Фёдоров Дмитрий"
        view.addSubview(nameLabel)
        
        let dateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 30))
        dateLabel.center = CGPoint(x: view.center.x, y: view.center.y + 100)
        dateLabel.textAlignment = .center
        dateLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        dateLabel.textColor = .black
        dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .none)
        view.addSubview(dateLabel)
        
       let profileImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        profileImageView.image = UIImage(named: "profile_picture")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
        profileImageView.center = CGPoint(x: view.center.x, y: view.center.y - 130)
        view.addSubview(profileImageView)
        
       
    }

}
