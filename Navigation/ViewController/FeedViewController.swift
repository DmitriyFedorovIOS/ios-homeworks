//
//  FeedViewController.swift
//  Navigation
//
//  Created by Fedorov Dmitry on 06.04.2023.
//

import UIKit



class FeedViewController: UIViewController {
    
    private var post: Post!
    
    let stackView = UIStackView()
 
    //MARK: - Button
    
    
   private lazy var buttonOne: UIButton = {
       
        let button = UIButton()
        button.setTitle("Открыть пост", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = UIColor(red: 0.12, green: 0.63, blue: 0.95, alpha: 1.00)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(openPostOne), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonTwo :UIButton = {
        let button = UIButton()
        button.setTitle("Открыть пост", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = UIColor(red: 0.12, green: 0.63, blue: 0.95, alpha: 1.00)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(openPostTwo), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let post = Post(title: "Мой пост")
        view.backgroundColor = .white
        addSubview()
        setupStackView()
        self.post = post
        setupConstraints()
    }
    
    //MARK: - Setup StackView
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    //MARK: - Constrain
    
    private func setupConstraints() {

    NSLayoutConstraint.activate([
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    
        buttonOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        buttonOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
    
        buttonTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        buttonTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
    ])

    }
    
    //MARK: - Add Subwiew
    
    private func addSubview() {
        
        view.addSubview(stackView)
    }
    //MARK: - Actions
    
    @objc func openPostOne() {
        let postViewController = PostViewController(post: post)
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    @objc func openPostTwo() {
        let postViewController = PostViewController(post: post)
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
}



