//
//  UILabel + extension.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 24.08.2022.
//

import UIKit

extension UILabel {
    
    func setupForSection(title: String) {
        text = title
        font = UIFont.systemFont(ofSize: 25, weight: .medium)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
