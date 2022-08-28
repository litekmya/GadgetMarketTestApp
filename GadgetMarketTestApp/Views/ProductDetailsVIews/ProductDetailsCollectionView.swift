//
//  ProductDetailsCollectionView.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 27.08.2022.
//

import UIKit

class ProductDetailsCollectionView: UICollectionView {
    
    init() {
        super.init(frame: .zero, collectionViewLayout: ProductDetailsCollectionView.createLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func createLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        return layout
    }
}
