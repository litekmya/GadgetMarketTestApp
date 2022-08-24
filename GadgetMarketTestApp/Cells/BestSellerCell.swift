//
//  BestSellerCell.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 22.08.2022.
//

import UIKit

class BestSellerCell: UICollectionViewCell, SelfConfigureCell {
    static var identifier = "BestSellerCell"
    
    let customView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupCustomView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cunfigure(with intValue: Int) {
        print(intValue)
    }
    
    private func setupView() {
        layer.cornerRadius = 10
        clipsToBounds = true
        addSubview(customView)
    }
    
    private func setupCustomView() {
        customView.frame = bounds
        customView.backgroundColor = .blue
    }
}
