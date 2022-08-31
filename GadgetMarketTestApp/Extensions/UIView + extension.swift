//
//  UIView + extension.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 26.08.2022.
//

import UIKit

extension UIView {
    
    func roundOff(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.frame = bounds
        mask.path = path.cgPath
        layer.mask = mask
    }
}
