//
//  MyCartController.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 31.08.2022.
//

import UIKit

class MyCartController: UIViewController {
    
    //MARK: - Private properties
    private let navigationView = CustomNavigationView()
    private let cartContentView = MyCartView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "My Cart"
        label.font = .installMarkProFont(for: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupNavigationView()
        setupTitle()
        setupCartContentView()
    }
    
    //MARK: - Layout
    private func setupView() {
        view.backgroundColor = .newGray
        view.addSubview(navigationView)
        view.addSubview(cartContentView)
        view.addSubview(titleLabel)
    }
    
    private func setupNavigationView() {
        navigationView.configureLayoutForView(parentView: view, topConstant: 42)
        navigationView.useWithTwoButtons(title: "Add address", imageName: "placeMark")
        navigationView.titleLabel.textAlignment = .right
    }
    
    private func setupTitle() {
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 44).isActive = true
        titleLabel.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 50).isActive = true
    }
    
    private func setupCartContentView() {
        cartContentView.translatesAutoresizingMaskIntoConstraints = false
        cartContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cartContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        cartContentView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 49).isActive = true
        cartContentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cartContentView.layer.cornerRadius = 30
        cartContentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
