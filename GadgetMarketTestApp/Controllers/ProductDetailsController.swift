//
//  ProductDetailsController.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 27.08.2022.
//

import UIKit

class ProductDetailsController: UIViewController {
    
    //MARK: - Private properties
    private let navigationView = CustomNavigationView()
//    private let collectionView = UICollectionView() // заменить на кастомный
    private let contentView = ProductDetailsView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupNavigationView()
        setupContentView()
        getData()
        addTargets()
    }
    
    //MARK: - Private methods
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
            DispatchQueue.main.async { [unowned self] in
                self.contentView.navigationView.titleLabel.text = models.title
                
                let titles = [models.CPU, models.camera, models.ssd, models.sd]
                self.contentView.infoView.titles = titles
                
                contentView.setColorView.firstColorButton.backgroundColor
            }
        }
    }
    
    private func addTargets() {
        navigationView.dismissButton.addTarget(self, action: #selector(dismissButtonAction), for: .touchUpInside)
        contentView.setColorView.firstColorButton.addTarget(self, action: #selector(firstColorButtonAction), for: .touchUpInside)
        contentView.setColorView.secondColorButton.addTarget(self, action: #selector(secondColorButtonAction), for: .touchUpInside)
    }
    
    //MARK: - @objc
    @objc private func dismissButtonAction() {
        dismiss(animated: true)
    }
    
    @objc private func firstColorButtonAction() {
        contentView.setColorView.secondColorButton.imageView?.isHidden = true
        contentView.setColorView.firstColorButton.imageView?.isHidden = false
    }
    
    @objc private func secondColorButtonAction() {
        contentView.setColorView.firstColorButton.imageView?.isHidden = true
        contentView.setColorView.secondColorButton.imageView?.isHidden = false
    }
}
