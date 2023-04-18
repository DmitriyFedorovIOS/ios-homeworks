//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Fedorov Dmitry on 15.04.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private let profilePictureImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "profile_picture")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 50
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Федоров Дмитрий"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private let bioTextField: UITextField = {
        let field = UITextField()
        field.text = "Музыкант, Фотограф"
        field.font = UIFont.systemFont(ofSize: 14)
        field.textColor = .gray
        field.borderStyle = .none
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    private let followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Покажи статус", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = UIColor(red: 0.12, green: 0.63, blue: 0.95, alpha: 1.00)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.masksToBounds = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setupConstraints()
        followButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        
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
    private func addSubview() {
        addSubview(profilePictureImageView)
        addSubview(nameLabel)
        addSubview(bioTextField)
        addSubview(followButton)
    }
    @objc func buttonPressed() {
        if let bioText = bioTextField.text {
            print("Мой статуса \(bioText)")
        } else {
            print("Нет Статус")
        }
    }
}


