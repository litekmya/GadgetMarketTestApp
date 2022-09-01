//
//  ProductDetailsController.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 27.08.2022.
//

import UIKit

class ProductDetailsController: UIViewController, UIScrollViewDelegate {
    
    weak var delegate: ProductDetailsDelegate!
    var phones: [Phone] = [] {
        didSet {
            if phones.count == 0 {
                navigationView.cauntValueLabel.isHidden = true
            } else {
                navigationView.cauntValueLabel.text = "\(phones.count)"
                navigationView.cauntValueLabel.isHidden = false
            }
            
        }
    }
    
    //MARK: - Private properties
    private let scrollView = UIScrollView()
    private let scrollContentView = UIView()
    private let navigationView = CustomNavigationView()
    private let carouselView = CarouselView()
    private let productDetailsView = ProductDetailsView()
    private var phone: Phone!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        view.backgroundColor = .newGray
        
        setupScrollView()
        setupScrollContentView()
        setupNavigationView()
        setupCarouselView()
        setupproductDetailsView()
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
        scrollContentView.addSubview(productDetailsView)
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
        navigationView.useWithTwoButtons(title: "Product Details", imageName: "cart")
    }
    
    private func setupCarouselView() {
        carouselView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        carouselView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        carouselView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 30).isActive = true
        carouselView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2.8).isActive = true
    }
    
    private func setupproductDetailsView() {
        productDetailsView.topAnchor.constraint(equalTo: carouselView.bottomAnchor).isActive = true
        productDetailsView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        productDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        productDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        productDetailsView.heightAnchor.constraint(equalToConstant: 470).isActive = true
    }
    
    //MARK: - Private methods
    private func getData() {
        NetworkManager.shared.fetchData(from: URLs.details.rawValue, type: Phone.self) { model in
            DispatchQueue.main.async { [unowned self] in
                self.productDetailsView.navigationView.titleLabel.text = model.title
                
                let titles = [model.CPU, model.camera, model.ssd, model.sd]
                self.productDetailsView.infoView.titles = titles
                
                guard let firstColor = model.color.first else { return }
                guard let secondColor = model.color.last else { return }
                productDetailsView.setColorView.firstColorButton.backgroundColor = UIColor(hex: firstColor)
                productDetailsView.setColorView.secondColorButton.backgroundColor = UIColor(hex: secondColor)
                
                guard let firstTitle = model.capacity.first else { return }
                guard let secondTitle = model.capacity.last else { return }
                productDetailsView.setColorView.firstCapacityButton.setTitle("\(firstTitle) GB", for: .normal)
                productDetailsView.setColorView.secondCapacityButton.setTitle("\(secondTitle) GB", for: .normal)
                
                var capacityButtons: [UIButton] = []
                capacityButtons.append(productDetailsView.setColorView.firstCapacityButton)
                capacityButtons.append(productDetailsView.setColorView.secondCapacityButton)
                
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
                
                for index in 0..<Int(model.rating) {
                    productDetailsView.ratingImages[index].image = UIImage(systemName: "star.fill")
                }
                
                productDetailsView.priceTitle = "$\(model.price)"
                
                phone = model
            }
        }
    }
    
    private func addTargets() {
        navigationView.dismissButton.addTarget(self, action: #selector(dismissButtonAction), for: .touchUpInside)
        productDetailsView.setColorView.firstColorButton.addTarget(self, action: #selector(firstColorButtonAction), for: .touchUpInside)
        productDetailsView.setColorView.secondColorButton.addTarget(self, action: #selector(secondColorButtonAction), for: .touchUpInside)
        
        productDetailsView.setColorView.firstCapacityButton.addTarget(self, action: #selector(firstCapasityButtonAction), for: .touchUpInside)
        productDetailsView.setColorView.secondCapacityButton.addTarget(self, action: #selector(secondCapacityButtonAction), for: .touchUpInside)
        productDetailsView.addToCartButton.addTarget(self, action: #selector(addToCartButtonAction), for: .touchUpInside)
        
        navigationView.doneButton.addTarget(self, action: #selector(doneButtonAction), for: .touchUpInside)
    }
    
    //MARK: - @objc
    @objc private func dismissButtonAction() {
        delegate.add(phones: phones)
        dismiss(animated: true)
    }
    
    @objc private func firstColorButtonAction() {
        productDetailsView.setColorView.secondColorButton.imageView?.isHidden = true
        productDetailsView.setColorView.firstColorButton.imageView?.isHidden = false
    }
    
    @objc private func secondColorButtonAction() {
        productDetailsView.setColorView.firstColorButton.imageView?.isHidden = true
        productDetailsView.setColorView.secondColorButton.imageView?.isHidden = false
    }
    
    @objc private func firstCapasityButtonAction() {
        productDetailsView.setColorView.secondCapacityButton.backgroundColor = .white
        productDetailsView.setColorView.secondCapacityButton.setTitleColor(.gray, for: .normal)
        productDetailsView.setColorView.firstCapacityButton.backgroundColor = .newOrange
        productDetailsView.setColorView.firstCapacityButton.setTitleColor(.white, for: .normal)
    }
    
    @objc private func secondCapacityButtonAction() {
        productDetailsView.setColorView.secondCapacityButton.backgroundColor = .newOrange
        productDetailsView.setColorView.secondCapacityButton.setTitleColor(.white, for: .normal)
        productDetailsView.setColorView.firstCapacityButton.backgroundColor = .white
        productDetailsView.setColorView.firstCapacityButton.setTitleColor(.gray, for: .normal)
    }
    
    @objc private func addToCartButtonAction() {
        
        UIView.animate(withDuration: 0.1) { [unowned self] in
            self.productDetailsView.addToCartButton.backgroundColor = .black
        } completion: { [unowned self]_ in
            self.productDetailsView.addToCartButton.backgroundColor = UIColor.newOrange
        }

        phones.append(phone)
    }
    
    @objc private func doneButtonAction() {
        let myCartController = MyCartController()
        myCartController.modalPresentationStyle = .fullScreen
        myCartController.cartContentView.phones = phones
        present(myCartController, animated: true)
    }
}
