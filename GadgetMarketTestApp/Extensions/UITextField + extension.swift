//
//  UITextField + extension.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 27.08.2022.
//

import UIKit

extension UITextField {
    
    func setRightView(with image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 10, width: 16, height: 16))
        iconView.clipsToBounds = true
        iconView.contentMode = .scaleAspectFit
        iconView.image = image
        
        let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        iconContainerView.addSubview(iconView)
        iconContainerView.contentMode = .left
        
        rightView = iconContainerView
        rightViewMode = .always
    }
}
