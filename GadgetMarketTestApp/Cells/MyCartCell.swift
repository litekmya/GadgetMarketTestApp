//
//  MyCartCell.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 31.08.2022.
//

import UIKit

class MyCartCell: UITableViewCell {
    
    //MARK: - Public properties
    static let indentifier = "MyCartCell"
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        return imageView
    }()
    let titleLabel: UILabel = {
        let label = configureLabel(textColor: .white)
        return label
    }()
    let priceLabel: UILabel = {
        let label = configureLabel(textColor: .newOrange)
        return label
    }()
    let trashImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "trash")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let countView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 40/255, green: 20/255, blue: 67/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    }()
    let minusButton: UIButton = {
        let button = configureButton(at: "minus")
        return button
    }()
    let plusButton: UIButton = {
        let button = configureButton(at: "plus")
        return button
    }()
    let countLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .white
        label.font = .installMarkProFont(for: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - LIfecycle
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        backgroundColor = .newDarkBlue
        addSubview(iconImageView)
        addSubview(trashImageView)
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(countView)
        
        setupImageViews()
        setupLabels()
        setupCountView()
        setupStackViewSubviews()
    }
    
    //MARK: - Layout
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
    
    private func setupCountView() {
        countView.trailingAnchor.constraint(equalTo: trashImageView.leadingAnchor, constant: -23).isActive = true
        countView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        countView.heightAnchor.constraint(equalToConstant: 68).isActive = true
        countView.widthAnchor.constraint(equalToConstant: 26).isActive = true
        
        countView.addSubview(minusButton)
        countView.addSubview(countLabel)
        countView.addSubview(plusButton)
    }
    
    private func setupStackViewSubviews() {
        minusButton.topAnchor.constraint(equalTo: countView.topAnchor, constant: 14).isActive = true
        minusButton.centerXAnchor.constraint(equalTo: countView.centerXAnchor).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: 2).isActive = true
        minusButton.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        plusButton.bottomAnchor.constraint(equalTo: countView.bottomAnchor, constant: -10).isActive = true
        plusButton.centerXAnchor.constraint(equalTo: countView.centerXAnchor).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 10).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        countLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        countLabel.widthAnchor.constraint(equalToConstant: 12).isActive = true
        countLabel.centerXAnchor.constraint(equalTo: countView.centerXAnchor).isActive = true
        countLabel.centerYAnchor.constraint(equalTo: countView.centerYAnchor).isActive = true
    }
    
    //MARK: - Private static func
    private static func configureButton(at imageName: String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: imageName), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private static func configureLabel(textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .installMarkProFont(for: 20)
        label.textColor = textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
