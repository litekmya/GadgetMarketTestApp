//
//  RatingStackView.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 28.08.2022.
//

import UIKit

class RatingStackView: UIStackView {
    
    var images: [UIImageView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        alignment = .
        distribution = .fillProportionally
        spacing = 9
        axis = .horizontal
        
        customizeUI()        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customizeUI() {
        for _ in 0..<5 {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
            imageView.image = UIImage(systemName: "star")
            imageView.tintColor = .yellow
            images.append(imageView)
        }
        
//        for imageView in images {
//            addSubview(imageView)
//        }
//        arrangedSubviews = images
    }
}
