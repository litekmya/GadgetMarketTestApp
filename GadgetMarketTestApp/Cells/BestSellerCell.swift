//
//  BestSellerCell.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 22.08.2022.
//

import UIKit

class BestSellerCell: UICollectionViewCell, SelfConfigureCell {
    
    //MARK: - Public properties
    static var identifier = "BestSellerCell"
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let discountPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.installMarkProFont(for: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.installMarkProFont(for: 10)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.installMarkProFont(for: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let isFavoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "isFavorite"), for: .normal)
        button.clipsToBounds = false
        button.contentMode = .scaleToFill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupImageView()
        setupLabels()
        setupIsFavoriteButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    private func setupView() {
        layer.cornerRadius = 10
        clipsToBounds = true
        backgroundColor = .white
        addSubview(iconImageView)
        addSubview(discountPriceLabel)
        addSubview(priceLabel)
        addSubview(titleLabel)
    }
    
    private func setupImageView() {
        iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        iconImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: -5).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 168).isActive = true
        iconImageView.addSubview(isFavoriteButton)
    }
    
    private func setupLabels() {
        discountPriceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21).isActive = true
        discountPriceLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 7).isActive = true
        
        priceLabel.leadingAnchor.constraint(equalTo: discountPriceLabel.trailingAnchor, constant: 7).isActive = true
        priceLabel.centerYAnchor.constraint(equalTo: discountPriceLabel.centerYAnchor).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21).isActive = true
        titleLabel.topAnchor.constraint(equalTo: discountPriceLabel.bottomAnchor, constant: 5).isActive = true
    }
        
    private func setupIsFavoriteButton() {
        isFavoriteButton.trailingAnchor.constraint(equalTo: iconImageView.trailingAnchor).isActive = true
        isFavoriteButton.topAnchor.constraint(equalTo: iconImageView.topAnchor).isActive = true
        isFavoriteButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        isFavoriteButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
    }
}
