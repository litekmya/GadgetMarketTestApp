//
//  TotalView.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 31.08.2022.
//

import UIKit

class TotalView: UIView {
    
    let totalLabel: UILabel = {
        let label = setupLabel(at: "Total")
        return label
    }()
    let deliveryLabel: UILabel = {
        let label = setupLabel(at: "Delivery")
        return label
    }()
    let totalActiveLabel: UILabel = {
        let label = setupLabel(at: "$6000 us")
        return label
    }()
    let delivetyActiveLabel: UILabel = {
        let label = setupLabel(at: "Free")
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
    
    private func customizeUI() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(totalLabel)
        addSubview(deliveryLabel)
        addSubview(totalActiveLabel)
        addSubview(delivetyActiveLabel)
        
        setupStatic(label: totalLabel, topView: self)
        setupStatic(label: deliveryLabel, topView: totalLabel)
        
        setupActive(label: totalActiveLabel, topView: self)
        setupActive(label: delivetyActiveLabel, topView: totalActiveLabel)
    }
    
    private func setupStatic(label: UILabel, topView: UIView) {
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 55).isActive = true
        label.topAnchor.constraint(equalTo: topView.topAnchor, constant: 15).isActive = true
    }
    
    private func setupActive(label: UILabel, topView: UIView) {
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -55).isActive = true
        label.topAnchor.constraint(equalTo: topView.topAnchor, constant: 15).isActive = true
    }
    
    private static func setupLabel(at title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textColor = .white
        label.font = .installMarkProFont(for: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
