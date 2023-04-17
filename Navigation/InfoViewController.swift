//
//  InfoViewController.swift
//  Navigation
//
//  Created by Fedorov Dmitry on 06.04.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let showAlertButton = UIButton()
        showAlertButton.setTitle("Показать предупреждение", for: .normal)
        showAlertButton.setTitleColor(.systemBlue, for: .normal)
        showAlertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        view.addSubview(showAlertButton)
        showAlertButton.translatesAutoresizingMaskIntoConstraints = false
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

