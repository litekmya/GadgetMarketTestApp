//
//  UINavigationController + extension.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 27.08.2022.
//

import UIKit

extension UINavigationController {
    
    func createTitle(for parentView: UIView, with title: String) -> UIView {
        let view = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: 200,
            height: 100)
        )
        
        let titleLabel = UILabel()
        view.addSubview(titleLabel)
        titleLabel.text = title
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.font = UIFont.installMarkProFont(for: 15)
        
        let placeButton = UIButton()
        view.addSubview(placeButton)
        placeButton.translatesAutoresizingMaskIntoConstraints = false
        placeButton.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -11).isActive = true
        placeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        placeButton.widthAnchor.constraint(equalToConstant: 12).isActive = true
        placeButton.heightAnchor.constraint(equalToConstant: 16).isActive = true
        placeButton.setImage(UIImage(named: "geo"), for: .normal)
        
        let arrowButton = UIButton()
        view.addSubview(arrowButton)
        arrowButton.translatesAutoresizingMaskIntoConstraints = false
        arrowButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 11).isActive = true
        arrowButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        arrowButton.widthAnchor.constraint(equalToConstant: 12).isActive = true
        arrowButton.heightAnchor.constraint(equalToConstant: 8).isActive = true
        arrowButton.setImage(UIImage(named: "downArrow"), for: .normal)
        
        return view
    }
}
