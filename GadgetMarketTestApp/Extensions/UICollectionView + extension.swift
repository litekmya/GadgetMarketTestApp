//
//  UICollectionView + extension.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 24.08.2022.
//

import UIKit

extension UICollectionView {
    
    func registerTheRequiredObjets() {
        register(SelectCategoryCell.self, forCellWithReuseIdentifier: SelectCategoryCell.identifier)
        register(HotSalesCell.self, forCellWithReuseIdentifier: HotSalesCell.identifier)
        register(BestSellerCell.self, forCellWithReuseIdentifier: BestSellerCell.identifier)
        
        register(ReuseHeaderView.self, forSupplementaryViewOfKind: MainCollectionView.reuseHeaderID, withReuseIdentifier: ReuseHeaderView.identifier)
        register(HotSalesHeaderView.self, forSupplementaryViewOfKind: MainCollectionView.hotSalesHeaderID, withReuseIdentifier: HotSalesHeaderView.identifier)
    }
}
