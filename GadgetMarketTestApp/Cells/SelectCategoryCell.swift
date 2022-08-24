//
//  SelectCategoryCell.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 22.08.2022.
//

import UIKit

protocol SelfConfigureCell {
    static var identifier: String { get }
    func cunfigure(with intValue: Int)
}

class SelectCategoryCell: UICollectionViewCell, SelfConfigureCell {
    
    static var identifier = "SelectCategoryCell"
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 36
        imageView.backgroundColor = .white
        return imageView
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "Phones"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupImageView()
        setupTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cunfigure(with intValue: Int) {
        print(intValue)
    }
    
    private func setupView() {
        clipsToBounds = true
        addSubview(iconImageView)
        addSubview(titleLabel)
    }
    
    private func setupImageView() {
        iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 71).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 71).isActive = true
        iconImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        iconImageView.backgroundColor = .white
    }
    
    private func setupTitleLabel() {
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 7).isActive = true
    }
}
