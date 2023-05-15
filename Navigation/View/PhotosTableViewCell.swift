//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Fedorov Dmitry on 15.05.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    
    private lazy var photoLabel = {
        
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Фото"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        return label
    }()
    
    private lazy var images: UIImageView = {
        
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var imageStackView = {
        
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fillEqually
        view.spacing = 8
        
        return view
    }()
    
    private lazy var arrow: UIImageView = {
        
        let view = UIImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addedSubview()
        setupConstraint()
        setupPreviews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addedSubview() {
        
        contentView.addSubview(photoLabel)
        contentView.addSubview(arrow)
        imageStackView.addSubview(images)
        contentView.addSubview(imageStackView)
    }
    
    func setupConstraint() {
        
        NSLayoutConstraint.activate([
            
            photoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            arrow.centerYAnchor.constraint(equalTo: photoLabel.centerYAnchor),
            arrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrow.widthAnchor.constraint(equalToConstant: 25),
            arrow.heightAnchor.constraint(equalToConstant: 25),
            
            imageStackView.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            imageStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            imageStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            imageStackView.heightAnchor.constraint(equalToConstant: 65),
            imageStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ])
    }
    
    private func setupPreviews() {
        
        let photoGallery = PhotoGallery.shared
        let shuffledPhotos = photoGallery.shuffled()
        
        for photo in shuffledPhotos.prefix(4) {
            
            let view = UIImageView(image: UIImage(named: photo.image))
            view.contentMode = .scaleAspectFill
            view.clipsToBounds = true
            view.layer.cornerRadius = 6
            imageStackView.addArrangedSubview(view)
            
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(greaterThanOrEqualToConstant: (imageStackView.bounds.width - 24) / 4),
                view.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            ])
        }
    }
}

