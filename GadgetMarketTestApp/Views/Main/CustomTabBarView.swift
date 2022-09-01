//
//  CustomTabBarView.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 24.08.2022.
//

import UIKit

class CustomTabBarView: UIView {
    
    //MARK: - Public properties
    let pointView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let explorerLabel: UILabel = {
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
    let cauntValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .newOrange
        label.font = .installMarkProFont(for: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    func setupLayout(parentView: UIView) {
        leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
        heightAnchor.constraint(equalToConstant: 72).isActive = true
    }
    
    private func customizeUI() {
        backgroundColor = UIColor.newDarkBlue
        clipsToBounds = true
        layer.cornerRadius = 30
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(pointView)
        addSubview(explorerLabel)
        addSubview(cartButton)
        addSubview(favoriteButton)
        addSubview(userButton)
        
        setupPointView()
        setupLabel()
        setupButtons()
        configureCartButton()
    }
    
    private func setupPointView() {
        pointView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 68).isActive = true
        pointView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pointView.widthAnchor.constraint(equalToConstant: 8).isActive = true
        pointView.heightAnchor.constraint(equalToConstant: 8).isActive = true
    }
    
    private func setupLabel() {
        explorerLabel.leadingAnchor.constraint(equalTo: pointView.trailingAnchor, constant: 7).isActive = true
        explorerLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setupButtons() {
        setSize(for: cartButton, leftView: explorerLabel)
        setSize(for: favoriteButton, leftView: cartButton)
        setSize(for: userButton, leftView: favoriteButton)
    }
    
    private func configureCartButton() {
        cartButton.addSubview(cauntValueLabel)
        
        cauntValueLabel.trailingAnchor.constraint(equalTo: cartButton.trailingAnchor, constant: 6).isActive = true
        cauntValueLabel.topAnchor.constraint(equalTo: cartButton.topAnchor, constant: -6).isActive = true
    }
    
    //MARK: - Private methods
    private func setSize(for button: UIButton, leftView: UIView) {
        button.leadingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: 47).isActive = true
        button.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 18).isActive = true
        button.widthAnchor.constraint(equalToConstant: 18).isActive = true
    }
}
