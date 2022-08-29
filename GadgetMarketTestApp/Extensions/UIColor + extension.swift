//
//  UIColor + extension.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 24.08.2022.
//

import UIKit

extension UIColor {
    
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        let length = hexSanitized.count
        var rgb: UInt64 = 0
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 1
        
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
        
        if length == 6 {
            
        } else if length == 8 {
            
        } else {
            return nil
        }
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static let newGray = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
    static let newDarkBlue = UIColor(red: 1/255, green: 0/255, blue: 53/255, alpha: 1)
    static let newOrange = UIColor(red: 255/255, green: 110/255, blue: 78/255, alpha: 1)
    static let newLightOrange = UIColor(red: 255/255, green: 184/255, blue: 0/255, alpha: 1)
}
