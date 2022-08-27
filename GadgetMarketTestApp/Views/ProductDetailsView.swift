//
//  ProductDetailsView.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 27.08.2022.
//

import UIKit

class ProductDetailsView: UIView {
    
    private let navigationView = CustomNavigationView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customizeUI()
    }
    
    private func customizeUI() {
        addSubview(navigationView)
        
        setupNavigationView()
    }
    
    private func setupNavigationView() {
        navigationView.configureLayoutForView(parentView: self, topConstant: 0)
        navigationView.useWithOneButton(title: "Galaxy Note 20 Ultra")
    }
}
