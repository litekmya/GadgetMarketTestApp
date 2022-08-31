//
//  ProductDetailsCollectionView.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 27.08.2022.
//

import UIKit

class ProductDetailsCollectionView: UICollectionView {
    
    var photos: [UIImage] = []
    
    init() {
        super.init(frame: .zero, collectionViewLayout: ProductDetailsCollectionView.createLayout())
        delegate = self
        dataSource = self
        translatesAutoresizingMaskIntoConstraints = false
        contentInset = UIEdgeInsets(top: 0,
                                    left: Constants.leftDistanceToView,
                                    bottom: 0,
                                    right: Constants.rightDistanceToView)
        
        register(ProductDetailsCell.self, forCellWithReuseIdentifier: ProductDetailsCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func createLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = Constants.imagesSpacing
        return layout
    }
    
    func set(photos: [UIImage]) {
        self.photos = photos
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ProductDetailsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDetailsCell.identifier, for: indexPath) as! ProductDetailsCell
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ProductDetailsCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Constants.imagesWidth, height: collectionView.bounds.height)
    }
}




