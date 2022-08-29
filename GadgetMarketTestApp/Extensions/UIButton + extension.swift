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
        setTitleColor(UIColor.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupForSetColorView(at radius: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .red
        clipsToBounds = true
        layer.cornerRadius = radius
    }
}
