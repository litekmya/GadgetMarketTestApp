//
//  ProductDetailsController.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 27.08.2022.
//

import UIKit

class ProductDetailsController: UIViewController {
    
    private let navigationView = CustomNavigationView()
//    private let collectionView = UICollectionView() // заменить на кастомный
    private let contentView = ProductDetailsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupNavigationView()
        setupContentView()
        getData()
    }
    
    private func setupView() {
        view.backgroundColor = .newGray
        view.addSubview(contentView)
        view.addSubview(navigationView)
    }
    
    private func setupNavigationView() {
        navigationView.configureLayoutForView(parentView: view, topConstant: 42)
        navigationView.useWithTwoButtons(title: "Product Details")
    }
    
    private func setupContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: view.bounds.height / 2).isActive = true
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 30
        contentView.backgroundColor = .white
    }
    
    private func getData() {
        NetworkManager.shared.fetchData(from: URLs.details.rawValue, type: Phone.self) { models in
            DispatchQueue.main.async {
                print(models)
            }
            
        }
    }
}
