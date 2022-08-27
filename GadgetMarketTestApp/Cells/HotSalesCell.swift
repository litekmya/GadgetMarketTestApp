//
//  HotSalesCell.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 22.08.2022.
//

import UIKit

class HotSalesCell: UICollectionViewCell, SelfConfigureCell {
    
    static var identifier = "HotSalesCell"
    
    //MARK: - Objects
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let isNewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "new")
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.installSFProDisplayFont(size: 25)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Iphone 12"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.installSFProDisplayFont(size: 11)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Some text"
        return label
    }()
    
    let buyNowButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "buyNow"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupIconImageView()
        setupIsNewImageView()
        setupLabels()
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    private func setupView() {
        backgroundColor = .white

        clipsToBounds = true
        layer.cornerRadius = 10
        addSubview(iconImageView)
    }
    
    private func setupIconImageView() {
        iconImageView.frame = bounds
        iconImageView.backgroundColor = .black
        
        iconImageView.addSubview(isNewImageView)
        iconImageView.addSubview(titleLabel)
        iconImageView.addSubview(descriptionLabel)
        iconImageView.addSubview(buyNowButton)
    }
    
    private func setupIsNewImageView() {
        isNewImageView.leadingAnchor.constraint(equalTo: iconImageView.leadingAnchor, constant: 25).isActive = true
        isNewImageView.topAnchor.constraint(equalTo: iconImageView.topAnchor, constant: 16).isActive = true
    }
    
    private func setupLabels() {
        titleLabel.leadingAnchor.constraint(equalTo: iconImageView.leadingAnchor, constant: 25).isActive = true
        titleLabel.topAnchor.constraint(equalTo: isNewImageView.bottomAnchor, constant: 18).isActive = true
        
        descriptionLabel.leadingAnchor.constraint(equalTo: iconImageView.leadingAnchor, constant: 25).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
    }
    
    private func setupButton() {
        buyNowButton.leadingAnchor.constraint(equalTo: iconImageView.leadingAnchor, constant: 25).isActive = true
        buyNowButton.bottomAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: -26).isActive = true
        buyNowButton.widthAnchor.constraint(equalToConstant: 98).isActive = true
        buyNowButton.heightAnchor.constraint(equalToConstant: 23).isActive = true
    }
}
