//
//  UIButton + extension.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 24.08.2022.
//

import UIKit

extension UIButton {
    
    func setupForCustomTabBar(at imageName: String) {
        setImage(UIImage(named: imageName), for: .normal)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupForSetColorView(at radius: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        titleLabel?.font = .installMarkProFont(for: 13)
        setTitleColor(.gray, for: .normal)
        layer.cornerRadius = radius
    }
    
    func setupForAddToCart(price: String) {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .newOrange
        layer.cornerRadius = 10
        
        let titleLabel = UILabel()
        addSubview(titleLabel)
        titleLabel.font = .installMarkProFont(for: 20)
        titleLabel.text = "Add to Cart"
        titleLabel.textColor = .white
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45).isActive = true
        
        let priceLabel = UILabel()
        addSubview(priceLabel)
        priceLabel.font = .installMarkProFont(for: 20)
        priceLabel.text = price
        priceLabel.textColor = .white
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45).isActive = true
    }
}
