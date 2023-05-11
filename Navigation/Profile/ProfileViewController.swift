//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Fedorov Dmitry on 15.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    fileprivate let data = PostFirst.make()
   
    private lazy var profileTableView: UITableView = {
        let profileTV = UITableView.init(frame: .zero, style: .grouped)
        profileTV.translatesAutoresizingMaskIntoConstraints = false
        return profileTV
    }()
    
    private enum CellReuseID: String {
        case base = "PostTableViewCell_ReuseID"
    }
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubview()
        setupContrain()
        tuneTableView()
    }
    
    //MARK: - Add Subwiew
    
    private func addSubview() {
        view.addSubview(profileTableView)
    }

    //MARK: - Add Constraint
    
    func setupContrain() {
        NSLayoutConstraint.activate([
            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func tuneTableView() {
        profileTableView.register(PostsTableViewCell.self, forCellReuseIdentifier: CellReuseID.base.rawValue)
        
        profileTableView.dataSource = self
        profileTableView.delegate = self
        
        profileTableView.rowHeight = UITableView.automaticDimension
        profileTableView.estimatedRowHeight = 1000
        
    }
}
    
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: PostsTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell_ReuseID", for: indexPath) as? PostsTableViewCell) else {
            return UITableViewCell()
        }
       
        let model = data[indexPath.row]
        cell.update(model)
        return cell
    }
}

// MARK: - extension

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 220
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let profileHeaderView = ProfileHeaderView()

        return profileHeaderView
    }
    
}

