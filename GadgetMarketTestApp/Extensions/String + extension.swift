//
//  String + extension.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 25.08.2022.
//

import UIKit

extension String {
    
    func strikeThrough() -> NSAttributedString {
        let attributeStyle = NSAttributedString.Key.strikethroughStyle
        let rawValue = NSUnderlineStyle.single.rawValue
        
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(attributeStyle, value: rawValue, range: NSMakeRange(0, attributeString.length))
        
        return attributeString
    }
}
