//
//  InfoViewController.swift
//  Navigation
//
//  Created by Fedorov Dmitry on 06.04.2023.
//

import UIKit

class InfoViewController: UIViewController {
    private lazy  var showAlertButton: UIButton = {
        let button = UIButton()
        button.setTitle("Показать предупреждение", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(showAlertButton)
        showAlertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showAlertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    
    @objc func showAlert() {
        let alertController = UIAlertController(title: "Предупреждение ", message: "Это пример контроллера оповещения", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Принять", style: .default) { _ in
            print("Вы нажали Принять")
        }
        alertController.addAction(action1)
        let action2 = UIAlertAction(title: "Отменить", style: .default) { _ in
            print("Вы нажали Отменить")
        }
        alertController.addAction(action2)
        present(alertController, animated: true, completion: nil)
    }
}

