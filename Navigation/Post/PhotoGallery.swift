//
//  PhotoGallery.swift
//  Navigation
//
//  Created by Fedorov Dmitry on 15.05.2023.
//

import UIKit

struct PhotoGallery {
    
    var image: String
    
}

extension PhotoGallery {
    
    static let shared = getImage()
    
    static func getImage() -> [PhotoGallery] {
        var images = [PhotoGallery]()
        
        images.append(PhotoGallery(image: "1"))
        images.append(PhotoGallery(image: "2"))
        images.append(PhotoGallery(image: "3"))
        images.append(PhotoGallery(image: "4"))
        images.append(PhotoGallery(image: "5"))
        images.append(PhotoGallery(image: "6"))
        images.append(PhotoGallery(image: "7"))
        images.append(PhotoGallery(image: "8"))
        images.append(PhotoGallery(image: "9"))
        images.append(PhotoGallery(image: "10"))
        images.append(PhotoGallery(image: "11"))
        images.append(PhotoGallery(image: "12"))
        images.append(PhotoGallery(image: "13"))
        images.append(PhotoGallery(image: "14"))
        images.append(PhotoGallery(image: "15"))
        images.append(PhotoGallery(image: "16"))
        images.append(PhotoGallery(image: "17"))
        images.append(PhotoGallery(image: "18"))
        images.append(PhotoGallery(image: "19"))
        images.append(PhotoGallery(image: "20"))
        
        return images
    }
}

