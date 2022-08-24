//
//  MainViewController.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 24.08.2022.
//

import UIKit

class MainViewController: UICollectionViewController {
    
    //MARK: - Static properties
    static let reuseHeaderID = "selectCategoryHeaderID"
    static let hotSalesHeaderID = "hotSalesHeaderID"
    
    //MARK: - Private properties
    private let contentView = CustomTabBarView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        title = "Zihuatanejo, Gro"
        view.addSubview(contentView)
        setupContentView()
    }
    
    init() {
        super.init(collectionViewLayout: MainViewController.createLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Static methods
    static func createLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { sectionIndex, layoutEnvirement in
            
            switch sectionIndex {
            case 0:
                return LayoutCreationService.selectCategoryLayout(with: reuseHeaderID)
            case 1:
                return LayoutCreationService.makeHotSalesLayout(with: hotSalesHeaderID)
            default:
                return LayoutCreationService.makeBestSellerLayout(with: reuseHeaderID)
            }
        }
    }

    //MARK: - Private methods
    private func setupCollectionView() {
        collectionView.register(SelectCategoryCell.self, forCellWithReuseIdentifier: SelectCategoryCell.identifier)
        collectionView.register(HotSalesCell.self, forCellWithReuseIdentifier: HotSalesCell.identifier)
        collectionView.register(BestSellerCell.self, forCellWithReuseIdentifier: BestSellerCell.identifier)
        
        collectionView.register(ReuseHeaderView.self, forSupplementaryViewOfKind: MainViewController.reuseHeaderID, withReuseIdentifier: ReuseHeaderView.identifier)
        collectionView.register(HotSalesHeaderView.self, forSupplementaryViewOfKind: MainViewController.hotSalesHeaderID, withReuseIdentifier: HotSalesHeaderView.identifier)
        
        collectionView.backgroundColor = UIColor.newGray
        view.addSubview(collectionView)
    }
    
    private func setupContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 72).isActive = true
    }
}

// MARK: UICollectionViewDataSource
extension MainViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 8
        case 1: return 5
        default: return 9
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectCategoryCell.identifier, for: indexPath) as! SelectCategoryCell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotSalesCell.identifier, for: indexPath) as! HotSalesCell
            cell.backgroundColor = .red
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestSellerCell.identifier, for: indexPath) as! BestSellerCell
            cell.backgroundColor = .green
            return cell
        }
    }
}

// MARK: UICollectionViewDelegate
extension MainViewController {
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ReuseHeaderView.identifier, for: indexPath) as! ReuseHeaderView
            return header
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HotSalesHeaderView.identifier, for: indexPath) as! HotSalesHeaderView
            return header
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ReuseHeaderView.identifier, for: indexPath) as! ReuseHeaderView
            
            header.viewAllButton.setTitle("see more", for: .normal)
            header.label.text = "Best Seller"
            return header
        }
    }
}
