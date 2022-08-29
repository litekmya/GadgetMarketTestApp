//
//  RatingStackView.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 28.08.2022.
//

import UIKit

class RatingView: UIView {
    
    var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        customizeUI()        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customizeUI() {
        stackView = UIStackView(arrangedSubviews: createImageViews())
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.distribution = .fillProportionally
        stackView.spacing = 9
        stackView.axis = .horizontal
    }
    
    private func createImageViews() -> [UIImageView] {
        var images: [UIImageView] = []
        for _ in 0..<5 {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
            imageView.image = UIImage(systemName: "star")
            imageView.tintColor = .newLightOrange
            images.append(imageView)
        }
        
        return images
    }
}
