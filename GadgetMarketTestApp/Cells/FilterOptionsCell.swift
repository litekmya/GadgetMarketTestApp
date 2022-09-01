//
//  FilterOptionsCell.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 26.08.2022.
//

import UIKit

class FilterOptionsCell: UITableViewCell {
    
    //MARK: - Public properties
    static let identifier = "FilterOptionsCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.installMarkProFont(for: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var textField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.setRightView(with: UIImage(named: "downArrow") ?? UIImage())
        field.translatesAutoresizingMaskIntoConstraints = false
        field.font = UIFont.installMarkProFont(for: 18)
        return field
    }()
    
    //MARK: - Lifecycle
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupView()
        setupTitle()
        setupTextField()
    }
    
    //MARK: - Layout
    private func setupView() {
        addSubview(titleLabel)
        addSubview(textField)
    }
    
    private func setupTitle() {
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 44).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
    }
    
    private func setupTextField() {
        textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 44).isActive = true
        textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 13).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -31).isActive = true
    }
}
