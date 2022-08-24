//
//  ReuseHeaderView.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 24.08.2022.
//

import UIKit

class ReuseHeaderView: UICollectionReusableView {
        
    static let identifier = "ReuseHeaderView"
    
    var label: UILabel = {
        let label = UILabel()
        label.setupForSection(title: "Select Category")
        return label
    }()
    
    var viewAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("view all", for: .normal)
        button.setTitleColor(UIColor.newOrange, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        addSubview(viewAllButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLabel()
        setupButton()
    }
    
    private func setupLabel() {
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17).isActive = true
    }
    
    private func setupButton() {
        viewAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -33).isActive = true
    }
}
