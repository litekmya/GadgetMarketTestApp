//
//  HotSalesCell.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 22.08.2022.
//

import UIKit

class HotSalesCell: UICollectionViewCell, SelfConfigureCell {
    
    static var identifier = "HotSalesCell"
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cunfigure(with intValue: Int) {
        print(intValue)
    }
    
    private func setupView() {
        backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 1/255, alpha: 1)

        clipsToBounds = true
        layer.cornerRadius = 10
        addSubview(iconImageView)
    }
    
    private func setupImageView() {
//        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.frame = bounds
        iconImageView.backgroundColor = .green
    }
}
