//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Fedorov Dmitry on 15.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let headerView = ProfileHeaderView()
    
    //MARK: - Button
    
    private let buttonProfileGreat: UIButton = {
        let button = UIButton()
        button.setTitle("Нажми", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = UIColor(red: 0.12, green: 0.63, blue: 0.95, alpha: 1.00)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
        
    }()
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray  
        view.addSubview(headerView)
        view.addSubview(buttonProfileGreat)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.frame = view.frame
        view.addSubview(headerView)
        addedSubwiew()
        setupConstraintProfile()
        
    }
    
    //MARK: - Add Subwiew
    
    func addedSubwiew() {
        view.addSubview(headerView)
    }
    
    //MARK: - Add Constraint
    func setupConstraintProfile() {
        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            headerView.heightAnchor.constraint(equalToConstant: 220),
            
            buttonProfileGreat.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            buttonProfileGreat.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonProfileGreat.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            buttonProfileGreat.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    //MARK: - Actions
    
    @objc private func buttonPressed(_ sender: UIButton) {
        if sender.title(for: .normal) == "Нажми меня" {
            sender.setTitle("Нажал", for: .normal)
        } else {
            sender.setTitle("Нажми меня", for: .normal)
        }
    }
}
