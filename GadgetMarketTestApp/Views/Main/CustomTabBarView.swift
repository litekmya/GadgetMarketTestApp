//
//  CustomTabBarView.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 24.08.2022.
//

import UIKit

class CustomTabBarView: UIView {
    
    let pointView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.text = "Explorer"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cartButton: UIButton = {
        let button = UIButton()
        button.setupForCustomTabBar(at: "market")
        return button
    }()
    
    let favoriteButton: UIButton = {
        let button = UIButton()
        button.setupForCustomTabBar(at: "favorite")
        return button
    }()
    
    let userButton: UIButton = {
        let button = UIButton()
        button.setupForCustomTabBar(at: "user")
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customizeUI()
    }
    
    private func customizeUI() {
        backgroundColor = UIColor.newDarkBlue
        clipsToBounds = true
        layer.cornerRadius = 30
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(pointView)
        addSubview(label)
        addSubview(cartButton)
        addSubview(favoriteButton)
        addSubview(userButton)
        
        setupPointView()
        setupLabel()
        setupButtons()
    }
    
    func setupLayout(parentView: UIView) {
        leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
        heightAnchor.constraint(equalToConstant: 72).isActive = true
    }
    
    private func setupPointView() {
        pointView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 68).isActive = true
        pointView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pointView.widthAnchor.constraint(equalToConstant: 8).isActive = true
        pointView.heightAnchor.constraint(equalToConstant: 8).isActive = true
    }
    
    private func setupLabel() {
        label.leadingAnchor.constraint(equalTo: pointView.trailingAnchor, constant: 7).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setupButtons() {
        cartButton.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 47).isActive = true
        cartButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        favoriteButton.leadingAnchor.constraint(equalTo: cartButton.trailingAnchor, constant: 52).isActive = true
        favoriteButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        userButton.leadingAnchor.constraint(equalTo: favoriteButton.trailingAnchor, constant: 52).isActive = true
        userButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }}
