//
//  ProductDetailsController.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 27.08.2022.
//

import UIKit

class ProductDetailsController: UIViewController, UIScrollViewDelegate {
    
    //MARK: - Private properties
    private let scrollView = UIScrollView()
    private let scrollContentView = UIView()
    private let navigationView = CustomNavigationView()
    private let carouselView = CarouselView()
    private let contentView = ProductDetailsView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        view.backgroundColor = .newGray
        
        setupScrollView()
        setupScrollContentView()
        setupNavigationView()
        setupCarouselView()
        setupContentView()
        getData()
        addTargets()
    }
    
    //MARK: - Layout
    private func setupScrollView() {
        scrollView.addSubview(scrollContentView)
        scrollView.delegate = self
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    private func setupScrollContentView() {
        scrollContentView.addSubview(contentView)
        scrollContentView.addSubview(navigationView)
        scrollContentView.addSubview(carouselView)
        
        scrollContentView.translatesAutoresizingMaskIntoConstraints = false
        scrollContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollContentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollView.contentSize = scrollContentView.frame.size
    }
    
    private func setupNavigationView() {
        navigationView.configureLayoutForView(parentView: scrollContentView, topConstant: 42)
        navigationView.useWithTwoButtons(title: "Product Details")
    }
    
    private func setupCarouselView() {
        carouselView.translatesAutoresizingMaskIntoConstraints = false
        carouselView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        carouselView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        carouselView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 30).isActive = true
        carouselView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2.8).isActive = true
        print(UIScreen.main.bounds.height)
        print(UIScreen.main.bounds.height / 2.8)
    }
    
    private func setupContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: carouselView.bottomAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 470).isActive = true
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 30
        contentView.backgroundColor = .white
    }
    
    //MARK: - Private methods
    private func getData() {
        NetworkManager.shared.fetchData(from: URLs.details.rawValue, type: Phone.self) { model in
            DispatchQueue.main.async { [unowned self] in
                self.contentView.navigationView.titleLabel.text = model.title
                
                let titles = [model.CPU, model.camera, model.ssd, model.sd]
                self.contentView.infoView.titles = titles
                
                guard let firstColor = model.color.first else { return }
                guard let secondColor = model.color.last else { return }
                contentView.setColorView.firstColorButton.backgroundColor = UIColor(hex: firstColor)
                contentView.setColorView.secondColorButton.backgroundColor = UIColor(hex: secondColor)
                
                guard let firstTitle = model.capacity.first else { return }
                guard let secondTitle = model.capacity.last else { return }
                contentView.setColorView.firstCapacityButton.setTitle("\(firstTitle) GB", for: .normal)
                contentView.setColorView.secondCapacityButton.setTitle("\(secondTitle) GB", for: .normal)
                
                var capacityButtons: [UIButton] = []
                capacityButtons.append(contentView.setColorView.firstCapacityButton)
                capacityButtons.append(contentView.setColorView.secondCapacityButton)
                
                for index in 0..<model.capacity.count {
                    capacityButtons[index].titleLabel?.text = model.capacity[index]
                }
                
                for index in 0..<model.images.count {
                    ImageManager.shared.getImage(from: model.images[index]) { image in
                        DispatchQueue.main.async { [unowned self] in
                            self.carouselView.images.append(image)
                        }
                    }
                }
                
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
