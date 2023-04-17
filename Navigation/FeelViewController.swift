//
//  FeelViewController.swift
//  Navigation
//
//  Created by Fedorov Dmitry on 10.04.2023.
//

import UIKit

class FeelViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        var closedNameLabel: UILabel {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 30))
            label.center = CGPoint(x: view.center.x, y: view.center.y)
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            label.textColor = .white
            label.backgroundColor = .black
            label.text = "У вас нет доступа, обратитесь к администратору"
            return label }
        view.addSubview(closedNameLabel)
        let alarmButton = UIBarButtonItem(image: UIImage(systemName: "exclamationmark.triangle.fill"), style: .plain, target: self, action: #selector(alarmButtonTapped))
        navigationItem.rightBarButtonItem = alarmButton
    }
    
    @objc private func alarmButtonTapped() {
        
        let alert = UIAlertController(title: "Внимание!", message: "Кнопка 'тревога' была нажата", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Вернуться в ленту", style: .default) { [weak self] _ in
            guard let self = self else { return }
            
            let nextVC = FeedViewController()
            
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
