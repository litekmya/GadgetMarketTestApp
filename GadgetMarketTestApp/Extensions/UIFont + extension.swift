//
//  UIFont + extension.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 27.08.2022.
//

import UIKit

extension UIFont {
    
    static func installMarkProFont(for size: CGFloat) -> UIFont {
        return UIFont(name: "MarkPro", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    static func installSFProDisplayFont(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-Regular", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
}
