//
//  SelectCategoryCell.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 22.08.2022.
//

import UIKit

//MARK: - SelfConfigureCell protocol
protocol SelfConfigureCell {
    static var identifier: String { get }
}

class SelectCategoryCell: UICollectionViewCell, SelfConfigureCell {
    
    //MARK: - Public properties
    static var identifier = "SelectCategoryCell"
    
    let iconView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 36
        view.backgroundColor = .white
        view.contentMode = .scaleAspectFit
        return view
    }()
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.installMarkProFont(for: 12)
        label.text = "Phones"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupCustomView()
        setupImageView()
        setupTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    private func setupView() {
        clipsToBounds = true
        addSubview(iconView)
        addSubview(titleLabel)
    }
    
    private func setupCustomView() {
        iconView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 71).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 71).isActive = true
        iconView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        iconView.backgroundColor = .white
        iconView.addSubview(imageView)
    }
    
    private func setupImageView() {
        imageView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: iconView.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupTitleLabel() {
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 7).isActive = true
    }
}
