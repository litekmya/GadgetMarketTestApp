//
//  SetColorView.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 28.08.2022.
//

import UIKit

class SetColorView: UIView {
    
    //MARK: - Public properties
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.installMarkProFont(for: 16)
        label.text = "Select color and capacity"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let firstColorButton: UIButton = {
        let button = UIButton()
        button.setupForSetColorView(at: 20)
        button.setImage(UIImage(named: "checkMark"), for: .normal)
        return button
    }()
    let secondColorButton: UIButton = {
        let button = UIButton()
        button.setupForSetColorView(at: 20)
        button.setImage(UIImage(named: "checkMark"), for: .normal)
        return button
    }()
    
    let firstCapacityButton: UIButton = {
        let button = UIButton()
        button.setupForSetColorView(at: 10)
        button.titleLabel?.font = .installMarkProFont(for: 13)
        button.setTitle("128GB", for: .normal)
        return button
    }()
    let secondCapacityButton: UIButton = {
        let button = UIButton()
        button.setupForSetColorView(at: 10)
        button.titleLabel?.font = .installMarkProFont(for: 13)
        button.setTitle("128GB", for: .normal)
        return button
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customizeUI()
    }
    
    //MARK: - Private methods
    private func customizeUI() {
        addSubview(titleLabel)
        addSubview(firstColorButton)
        addSubview(secondColorButton)
        addSubview(firstCapacityButton)
        addSubview(secondCapacityButton)
        
        setupTitleLabel()
        setupColorButtons()
        setupCapacityButtons()
    }
    
    private func setupTitleLabel() {
        setupToTheLeading(for: titleLabel,
                          leadingView: leadingAnchor,
                          leading: 30,
                          topView: topAnchor,
                          top: 0)
    }
    
    private func setupColorButtons() {
        setupToTheLeading(for: firstColorButton,
                          leadingView: leadingAnchor,
                          leading: 0,
                          topView: titleLabel.bottomAnchor,
                          top: 15)
        setup(button: firstColorButton, width: 40, height: 40)
        
        setupToTheLeading(for: secondColorButton,
                          leadingView: firstColorButton.trailingAnchor,
                          leading: 19,
                          topView: titleLabel.bottomAnchor,
                          top: 15)
        setup(button: secondColorButton, width: 40, height: 40)
        secondColorButton.imageView?.isHidden = true
    }
    
    private func setupCapacityButtons() {
        setupToTheTrailing(for: secondCapacityButton,
                           trailingView: trailingAnchor,
                           trailing: 0,
                           topView: titleLabel.bottomAnchor,
                           top: 17)
        setup(button: secondCapacityButton, width: 69, height: 31)
        
        setupToTheTrailing(for: firstCapacityButton,
                           trailingView: secondCapacityButton.leadingAnchor,
                           trailing: -21,
                           topView: titleLabel.bottomAnchor,
                           top: 17)
        setup(button: firstCapacityButton, width: 69, height: 31)
    }
    
    private func setupToTheLeading(for view: UIView,
                                   leadingView: NSLayoutXAxisAnchor,
                                   leading: CGFloat,
                                   topView: NSLayoutYAxisAnchor,
                                   top: CGFloat) {
        view.leadingAnchor.constraint(equalTo: leadingView, constant: leading).isActive = true
        view.topAnchor.constraint(equalTo: topView, constant: top).isActive = true
    }
    
    private func setupToTheTrailing(for view: UIView,
                                    trailingView: NSLayoutXAxisAnchor,
                                    trailing: CGFloat,
                                    topView: NSLayoutYAxisAnchor,
                                    top: CGFloat) {
        view.trailingAnchor.constraint(equalTo: trailingView, constant: trailing).isActive = true
        view.topAnchor.constraint(equalTo: topView, constant: top).isActive = true
    }
    
    private func setup(button: UIButton, width: CGFloat, height: CGFloat) {
        button.widthAnchor.constraint(equalToConstant: width).isActive = true
        button.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
