//
//  FilterOptionsNavigationView.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 27.08.2022.
//

import UIKit

class CustomNavigationView: UIView {
    
    let dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dismiss"), for: .normal)
        button.tintColor = .newDarkBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let doneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .newOrange
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.setTitle("Done", for: .normal)
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.installMarkProFont(for: 18)
        label.text = "Filter options"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customizeUI()
    }
    
    func configureLayoutForView(parentView: UIView, topConstant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: parentView.topAnchor, constant: topConstant).isActive = true
        heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func useWithTwoButtons(title: String) {
        doneButton.setImage(UIImage(named: "cart"), for: .normal)
        doneButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35).isActive = true
        doneButton.centerYAnchor.constraint(equalTo: dismissButton.centerYAnchor).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 37).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 37).isActive = true
        
        dismissButton.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true
        titleLabel.text = title
    }
    
    func useWithOneButton(title: String) {
        useWithTwoButtons(title: title)
        
        doneButton.setImage(UIImage(named: "favoriteDark"), for: .normal)
        dismissButton.isHidden = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 38).isActive = true
        titleLabel.font = UIFont.installMarkProFont(for: 24)
    }
    
    private func customizeUI() {
        addSubview(dismissButton)
        addSubview(doneButton)
        addSubview(titleLabel)
        
        setupButtons()
        setupTitle()
    }
    
    private func setupButtons() {
        dismissButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 44).isActive = true
        dismissButton.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 37).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: 37).isActive = true
        
        doneButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        doneButton.centerYAnchor.constraint(equalTo: dismissButton.centerYAnchor).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 37).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 86).isActive = true
    }
    
    private func setupTitle() {
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: dismissButton.centerYAnchor).isActive = true
    }
}
