//
//  FeedViewController.swift
//  Navigation
//
//  Created by Fedorov Dmitry on 06.04.2023.
//

import UIKit



class FeedViewController: UIViewController {
    
    private var post: Post!
    
    private var buttonPost: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Выбрать пост", for: .normal)
        button.addTarget(self, action: #selector(openPost), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let post = Post(title: "Мой пост")
        view.backgroundColor = .white
        view.addSubview(buttonPost)
        
        NSLayoutConstraint.activate([
            buttonPost.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonPost.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        self.post = post
    }
    
    @objc private func openPost() {
        let postViewController = PostViewController(post: post)
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
}



