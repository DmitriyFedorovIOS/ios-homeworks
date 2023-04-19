//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Fedorov Dmitry on 15.04.2023.
//

import UIKit

class ProfileHeaderView: UIView, UITextFieldDelegate {
    
    //MARK: - ImageView Avatar
    
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
    
    //MARK: - Name Label
    
        private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Федоров Дмитрий"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
    
    //MARK: - Status Label
    
    private let bioTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Музыкант, Фотограф"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Button
    
    private let followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Поменять статус", for: .normal)
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
        
        
        return button
    }()
    
    //MARK: - Status
    
    private var statusText: String = ""
    
    //MARK: - TextField Status
    
    private lazy var statusTextField: UITextField = {
        var myTextField = UITextField()
        myTextField.placeholder = "Музыкант, Фотограф"
        myTextField.text = " "
        myTextField.borderStyle = UITextField.BorderStyle.none
        myTextField.layer.backgroundColor = UIColor.white.cgColor
        myTextField.layer.borderWidth = 1
        myTextField.layer.borderColor = UIColor.black.cgColor
        myTextField.layer.cornerRadius = 12
        myTextField.minimumFontSize = 15
        myTextField.textColor = UIColor.black
        myTextField.delegate = self
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        myTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        return myTextField
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray4
        addSubview()
        setupConstraints()
        followButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constrain
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            profilePictureImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            profilePictureImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profilePictureImageView.widthAnchor.constraint(equalToConstant: 100),
            profilePictureImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: profilePictureImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: profilePictureImageView.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bioTextLabel.leadingAnchor.constraint(equalTo: profilePictureImageView.trailingAnchor, constant: 16),
            bioTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            bioTextLabel.centerYAnchor.constraint(equalTo: profilePictureImageView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            followButton.topAnchor.constraint(equalTo: bioTextLabel.bottomAnchor, constant: 80),
            followButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            followButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            followButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            statusTextField.topAnchor.constraint(equalTo:  bioTextLabel.bottomAnchor, constant: 16),
            statusTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 120),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    //MARK: - Add Subwiew
    
    private func addSubview() {
        addSubview(profilePictureImageView)
        addSubview(nameLabel)
        addSubview(bioTextLabel)
        addSubview(followButton)
        addSubview(statusTextField)
    }
    
    //MARK: - Actions
    
    @objc private func pressedButton() {
        bioTextLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }
}


