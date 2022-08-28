//
//  ProductDetailsView.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 27.08.2022.
//

import UIKit

class ProductDetailsView: UIView {
    
    let navigationView = CustomNavigationView()
    var ratingView: UIStackView!
    var ratingImages: [UIImageView] = []
    
    let segmentedControl: HBSegmentedControl = {
        let control = HBSegmentedControl()
        control.items = ["Shop", "Details", "Features"]
        control.borderColor = .clear
        control.font = UIFont.installMarkProFont(for: 20)
        
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    let infoView = UIStackView()
    
    let setColorView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customizeUI()
    }
    
    private func customizeUI() {
        addSubview(navigationView)
        
        setupNavigationView()
        setupRatingStackView()
        setupSegmentedControl()
    }
    
    private func setupNavigationView() {
        navigationView.configureLayoutForView(parentView: self, topConstant: 0)
        navigationView.useWithOneButton(title: "Galaxy Note 20 Ultra")
    }
    
    private func setupRatingStackView() {
        for _ in 0..<5 {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
            imageView.image = UIImage(systemName: "star")
            imageView.tintColor = .newLightOrange
            ratingImages.append(imageView)
        }
        
        ratingView = UIStackView(arrangedSubviews: ratingImages)
        ratingView.spacing = 9
        addSubview(ratingView)
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        ratingView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 38).isActive = true
        ratingView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 7).isActive = true
    }
    
    private func setupSegmentedControl() {
        addSubview(segmentedControl)
        segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 27).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -27).isActive = true
        segmentedControl.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 32).isActive = true
    }
}
