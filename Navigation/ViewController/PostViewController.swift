//
//  PostViewController.swift
//  Navigation
//
//  Created by Fedorov Dmitry on 06.04.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    private let post: Post
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Не было выполнено")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = post.title
        view.backgroundColor = .lightGray
        let infoButton = UIBarButtonItem(title: "Информация", style: .plain, target: self, action: #selector(openInfo))
        navigationItem.rightBarButtonItem = infoButton
    }
    
    @objc private func openInfo() {
        let infoViewController = InfoViewController()
        let navigationController = UINavigationController(rootViewController: infoViewController)
        present(navigationController, animated: true, completion: nil)
    }
}
