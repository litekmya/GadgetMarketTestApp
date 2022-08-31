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
    
    let segmentedControl: HBSegmentedControl = {
        let control = HBSegmentedControl()
        control.items = ["Shop", "Details", "Features"]
        control.borderColor = .clear
        control.font = UIFont.installMarkProFont(for: 20)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    let infoView = InformationView()
    let setColorView = SetColorView()
    
    let addToCartButton: UIButton = {
        let button = UIButton()
        button.setupForAddToCart(price: "$1500")
        return button
    }()
    
    var images: [UIImageView] = []
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customizeUI()
    }
    
    private func customizeUI() {
        clipsToBounds = true
        layer.cornerRadius = 30
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        backgroundColor = .white
        
        addSubview(navigationView)
        addSubview(segmentedControl)
        addSubview(infoView)
        addSubview(setColorView)
        addSubview(addToCartButton)
        
        setupNavigationView()
        setupRatingView()
        setupSegmentedControl()
        setupInfoView()
        setupSetColorView()
        setupAddToCartButton()
    }
    
    private func setupNavigationView() {
        navigationView.configureLayoutForView(parentView: self, topConstant: 0)
        navigationView.useWithOneButton()
    }
    
    private func setupRatingView() {
        images = createImageViews()
        
        ratingView = UIStackView(arrangedSubviews: images)
        ratingView.distribution = .fillProportionally
        ratingView.spacing = 9
        ratingView.axis = .horizontal
        addSubview(ratingView)
        
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        ratingView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 38).isActive = true
        ratingView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 7).isActive = true
    }
    
    private func setupAddToCartButton() {
        addToCartButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 29).isActive = true
        addToCartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -29).isActive = true
        addToCartButton.topAnchor.constraint(equalTo: setColorView.bottomAnchor, constant: 24).isActive = true
        addToCartButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
        addToCartButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true

    }
    
    private func setupInfoView() {
        setupXCoordinate(subview: infoView, leading: 30, trailing: -30)
        setupYCoordinate(subview: infoView,
                         top: 24,
                         topView: segmentedControl.bottomAnchor,
                         height: 50)
    }
    
    private func setupSetColorView() {
        setupXCoordinate(subview: setColorView, leading: 30, trailing: -30)
        setupYCoordinate(subview: setColorView,
                         top: 24,
                         topView: infoView.bottomAnchor,
                         height: 76)
    }
    
    private func setupSegmentedControl() {
        setupXCoordinate(subview: segmentedControl, leading: 27, trailing: -27)
        segmentedControl.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 32).isActive = true
    }
    
    private func setupXCoordinate(subview: UIView, leading: CGFloat, trailing: CGFloat) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leading).isActive = true
        subview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: trailing).isActive = true
    }
    
    private func setupYCoordinate(subview: UIView, top: CGFloat, topView: NSLayoutYAxisAnchor, height: CGFloat) {
        subview.topAnchor.constraint(equalTo: topView, constant: top).isActive = true
        subview.heightAnchor.constraint(equalToConstant: height).isActive = true
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
