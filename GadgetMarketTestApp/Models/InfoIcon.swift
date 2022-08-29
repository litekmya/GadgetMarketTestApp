//
//  InfoIcon.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 29.08.2022.
//

import UIKit

struct InfoIcon {
    var icon: UIImage
    
    static func getIcons() -> [InfoIcon] {
        guard let image = UIImage(systemName: "star") else { return [InfoIcon(icon: UIImage())]}
        
        return [InfoIcon(icon: (UIImage(named: "processor") ?? image)),
                InfoIcon(icon: (UIImage(named: "camera") ?? image)),
                InfoIcon(icon: (UIImage(named: "ssd") ?? image)),
                InfoIcon(icon: (UIImage(named: "sd") ?? image))]
    }
}
