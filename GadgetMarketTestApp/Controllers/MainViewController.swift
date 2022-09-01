//
//  MainViewController.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 24.08.2022.
//

import UIKit

protocol MainCollectionViewDelegate: AnyObject {
    
    func present()
}

protocol ProductDetailsDelegate: AnyObject {
    
    func add(phones: [Phone])
}

class MainViewController: UIViewController {
    
    //MARK: - Private properties
    private let tabBarView = CustomTabBarView()
    private var filterButton: UIBarButtonItem!
    private var customCollectionView: MainCollectionView!
    private var phones: [Phone] = [] {
        didSet {
            tabBarView.cauntValueLabel.text = "\(phones.count)"
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupCollectionView()
        setupTabBarView()
        setupBarButton()
        getDataFromNetwork()
    }

    //MARK: - Private methods
    private func setupView() {
        let navController = UINavigationController()
        let customTitleView = navController.createTitle(for: view, with: "Zihuatanejo, Gro")
        navigationItem.titleView = customTitleView
    }
    
    private func setupCollectionView() {
        customCollectionView = MainCollectionView(mainDelegate: self)
        view.addSubview(customCollectionView)
        customCollectionView.frame = view.bounds
    }
    
    private func setupTabBarView() {
        view.addSubview(tabBarView)
        tabBarView.setupLayout(parentView: view)
        
        tabBarView.cartButton.addTarget(self, action: #selector(addToCartButtonAction), for: .touchUpInside)
    }
    
    private func setupBarButton() {
        filterButton = UIBarButtonItem(image: UIImage(named: "filteredButton"),
                                       style: .done,
                                       target: self,
                                       action: #selector(filterButtonAction))
        filterButton.tintColor = .black
        navigationItem.rightBarButtonItem = filterButton
    }
    
    private func getDataFromNetwork() {
        NetworkManager.shared.fetchData(from: URLs.main.rawValue, type: StoreModel.self) { models in
            DispatchQueue.main.async { [unowned self] in
                customCollectionView.models = models
                customCollectionView.reloadData()
            }
        }
    }
    
    //MARK: - @objc
    @objc private func filterButtonAction() {
        let filterOptionsController = FilterOptionsViewController()
        filterOptionsController.modalPresentationStyle = .custom
        filterOptionsController.transitioningDelegate = self
        present(filterOptionsController, animated: true)
    }
    
    @objc private func addToCartButtonAction() {
        let myCartController = MyCartController()
        myCartController.modalPresentationStyle = .fullScreen
        myCartController.cartContentView.phones = phones
        present(myCartController, animated: true)
    }
}

//MARK: - UIViewControllerTransitioningDelegate
extension MainViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentstionController(presentedViewController: presented, presenting: presenting)
    }
}

//MARK: - MainCollectionViewDelegate
extension MainViewController: MainCollectionViewDelegate {
    
    func present() {
        let productDetailsVC = ProductDetailsController()
        productDetailsVC.modalPresentationStyle = .fullScreen
        productDetailsVC.delegate = self
        productDetailsVC.phones = phones
        present(productDetailsVC, animated: true)
    }
}

//MARK: - ProductDetailsDelegate
extension MainViewController: ProductDetailsDelegate {
    
    func add(phones: [Phone]) {
        self.phones = phones
    }}
