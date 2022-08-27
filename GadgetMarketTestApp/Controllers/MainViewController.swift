//
//  MainViewController.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 24.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Private properties
    private let contentView = CustomTabBarView()
    private var filterButton: UIBarButtonItem!
    private let customCollectionView = MainCollectionView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupCollectionView()
        setupContentView()
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
        view.addSubview(customCollectionView)
        customCollectionView.frame = view.bounds
    }
    
    private func setupContentView() {
        view.addSubview(contentView)
        contentView.setupLayout(parentView: view)
    }
    
    private func setupBarButton() {
        filterButton = UIBarButtonItem(image: UIImage(named: "filteredButton"), style: .done, target: self, action: #selector(filterButtonAction))
        filterButton.tintColor = .black
        navigationItem.rightBarButtonItem = filterButton
    }
    //MARK: - @objc
    @objc private func filterButtonAction() {
        let filterOptionsVC = FilterOptionsViewController()
        filterOptionsVC.modalPresentationStyle = .custom
        filterOptionsVC.transitioningDelegate = self
        
        present(filterOptionsVC, animated: true)
    }
    
    private func getDataFromNetwork() {
        NetworkManager.shared.fetchData(from: URLs.main.rawValue) { models in
            DispatchQueue.main.async { [unowned self] in
                customCollectionView.models = models
                customCollectionView.reloadData()
            }
        }
    }
}


//MARK: - UIViewControllerTransitioningDelegate
extension MainViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentstionController(presentedViewController: presented, presenting: presenting)
    }
}
