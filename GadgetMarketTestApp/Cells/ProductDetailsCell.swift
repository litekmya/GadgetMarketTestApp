//
//  ProductDetailsCell.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 30.08.2022.
//

import UIKit

class ProductDetailsCell: UICollectionViewCell {
    
    static let identifier = "ProductDetailsCell"
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: 0,
            y: 0,
            width: UIScreen.main.bounds.width / 1.4,
            height: UIScreen.main.bounds.height / 2.14)
        )

        imageView.backgroundColor = .white
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainImageView)
        
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView() {
        mainImageView.center = contentView.center
    }
}
