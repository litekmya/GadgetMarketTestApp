//
//  MyCartCell.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 31.08.2022.
//

import UIKit

class MyCartCell: UITableViewCell {
    
    static let indentifier = "MyCartCell"
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        return imageView
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .installMarkProFont(for: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .installMarkProFont(for: 20)
        label.textColor = .newOrange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let trashImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "trash")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var stackView: UIStackView!
    
    let minusButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    let plusButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    let countLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        backgroundColor = .newDarkBlue
        addSubview(iconImageView)
        addSubview(trashImageView)
        addSubview(titleLabel)
        addSubview(priceLabel)
        
        setupImageViews()
        setupLabels()
        setupStackView()
    }
    
    private func setupImageViews() {
        iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 88).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 88).isActive = true
        
        trashImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        trashImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        trashImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        trashImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    private func setupLabels() {
        titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 17).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        priceLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 17).isActive = true
        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
    }
    
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [minusButton, countLabel, plusButton])
        stackView.axis = .vertical
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.trailingAnchor.constraint(equalTo: trashImageView.leadingAnchor, constant: -23).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 68).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 26).isActive = true
        stackView.layer.cornerRadius = 14
        stackView.backgroundColor = .newGray
    }

}
