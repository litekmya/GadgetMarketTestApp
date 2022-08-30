//
//  ProductDetailsController.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 27.08.2022.
//

import UIKit

class ProductDetailsController: UIViewController {
    
    //MARK: - Private properties
    private let scrollView = UIScrollView()
    private let navigationView = CustomNavigationView()
    private let carouselView = CarouselView()
    private let contentView = ProductDetailsView()
    
    private let addToCartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupNavigationView()
        setupCarouselView()
        setupContentView()
        getData()
        addTargets()
        
//        collectionView.set(photos: <#T##[UIImage]#>) исправить после получения данных
    }
    
    //MARK: - Layout
    private func setupView() {
        
        view.backgroundColor = .newGray
        view.addSubview(contentView)
        view.addSubview(navigationView)
        view.addSubview(carouselView)
    }
    
    private func setupNavigationView() {
        navigationView.configureLayoutForView(parentView: view, topConstant: 42)
        navigationView.useWithTwoButtons(title: "Product Details")
    }
    
    private func setupCarouselView() {
        carouselView.translatesAutoresizingMaskIntoConstraints = false
        carouselView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        carouselView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        carouselView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 30).isActive = true
        carouselView.heightAnchor.constraint(equalToConstant: view.frame.height / 2 - 140).isActive = true
        carouselView.backgroundColor = .green
        print("===================Размер VC - \(view.frame.height / 2 - 140)")
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
    
    //MARK: - Private methods
    private func getData() {
        NetworkManager.shared.fetchData(from: URLs.details.rawValue, type: Phone.self) { models in
            DispatchQueue.main.async { [unowned self] in
                self.contentView.navigationView.titleLabel.text = models.title
                
                let titles = [models.CPU, models.camera, models.ssd, models.sd]
                self.contentView.infoView.titles = titles
                
                guard let firstColor = models.color.first else { return }
                guard let secondColor = models.color.last else { return }
                contentView.setColorView.firstColorButton.backgroundColor = UIColor(hex: firstColor)
                contentView.setColorView.secondColorButton.backgroundColor = UIColor(hex: secondColor)
                
                guard let firstTitle = models.capacity.first else { return }
                guard let secondTitle = models.capacity.last else { return }
                contentView.setColorView.firstCapacityButton.setTitle("\(firstTitle) GB", for: .normal)
                contentView.setColorView.secondCapacityButton.setTitle("\(secondTitle) GB", for: .normal)
            }
        }
    }
    
    private func addTargets() {
        navigationView.dismissButton.addTarget(self, action: #selector(dismissButtonAction), for: .touchUpInside)
        contentView.setColorView.firstColorButton.addTarget(self, action: #selector(firstColorButtonAction), for: .touchUpInside)
        contentView.setColorView.secondColorButton.addTarget(self, action: #selector(secondColorButtonAction), for: .touchUpInside)
        
        contentView.setColorView.firstCapacityButton.addTarget(self, action: #selector(firstCapasityButtonAction), for: .touchUpInside)
        contentView.setColorView.secondCapacityButton.addTarget(self, action: #selector(secondCapacityButtonAction), for: .touchUpInside)
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
    
    @objc private func firstCapasityButtonAction() {
        contentView.setColorView.secondCapacityButton.backgroundColor = .white
        contentView.setColorView.secondCapacityButton.setTitleColor(.gray, for: .normal)
        contentView.setColorView.firstCapacityButton.backgroundColor = .newOrange
        contentView.setColorView.firstCapacityButton.setTitleColor(.white, for: .normal)
    }
    
    @objc private func secondCapacityButtonAction() {
        contentView.setColorView.secondCapacityButton.backgroundColor = .newOrange
        contentView.setColorView.secondCapacityButton.setTitleColor(.white, for: .normal)
        contentView.setColorView.firstCapacityButton.backgroundColor = .white
        contentView.setColorView.firstCapacityButton.setTitleColor(.gray, for: .normal)
    }
}
