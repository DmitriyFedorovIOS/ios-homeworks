//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Fedorov Dmitry on 15.04.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private let profilePictureImageView = UIImageView()
    private let nameLabel = UILabel()
    private let bioTextField = UITextField()
    private let followButton = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
        followButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        
        profilePictureImageView.image = UIImage(named: "profile_picture")
        profilePictureImageView.contentMode = .scaleAspectFill
        profilePictureImageView.clipsToBounds = true
        profilePictureImageView.layer.cornerRadius = 50
        profilePictureImageView.layer.borderWidth = 3
        profilePictureImageView.layer.borderColor = UIColor.white.cgColor
        addSubview(profilePictureImageView)
        
        nameLabel.text = "Федоров Дмитрий"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.textColor = .white
        addSubview(nameLabel)
        
        bioTextField.text = "Музыкант, Фотограф"
        bioTextField.font = UIFont.systemFont(ofSize: 14)
        bioTextField.textColor = .white
        bioTextField.borderStyle = .none
        addSubview(bioTextField)
        
        followButton.setTitle("Покажи статус", for: .normal)
        followButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        followButton.backgroundColor = UIColor(red: 0.12, green: 0.63, blue: 0.95, alpha: 1.00)
        followButton.layer.cornerRadius = 8
        followButton.layer.masksToBounds = true
        followButton.translatesAutoresizingMaskIntoConstraints = false
        followButton.layer.shadowColor = UIColor.black.cgColor
        followButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        followButton.layer.shadowOpacity = 0.7
        followButton.layer.shadowRadius = 4
        followButton.layer.masksToBounds = false
        addSubview(followButton)
    }
    
    private func setupConstraints() {
        profilePictureImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        bioTextField.translatesAutoresizingMaskIntoConstraints = false
        followButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            profilePictureImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            profilePictureImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profilePictureImageView.widthAnchor.constraint(equalToConstant: 100),
            profilePictureImageView.heightAnchor.constraint(equalToConstant: 100),
            
            nameLabel.leadingAnchor.constraint(equalTo: profilePictureImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: profilePictureImageView.topAnchor),
            
            bioTextField.leadingAnchor.constraint(equalTo: profilePictureImageView.trailingAnchor, constant: 16),
            bioTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            bioTextField.centerYAnchor.constraint(equalTo: profilePictureImageView.centerYAnchor),
            
            followButton.topAnchor.constraint(equalTo: bioTextField.bottomAnchor, constant: 60),
            followButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            followButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            followButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    @objc func buttonPressed() {
        if let bioText = bioTextField.text {
            print("Мой статуса \(bioText)")
        } else {
            print("Нет Статус")
        }
    }
}


