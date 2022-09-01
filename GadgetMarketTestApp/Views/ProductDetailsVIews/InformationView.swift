//
//  InformationView.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 29.08.2022.
//

import UIKit

class InformationView: UIView {
    
    //MARK: - Public properties
    var iconsStackView: UIStackView!
    var labelsStackView: UIStackView!
    
    var titles: [String] = [] {
        didSet {
            labelsStackView = setup(subiews: createInfoLabels())
            labelsStackView.topAnchor.constraint(equalTo: iconsStackView.bottomAnchor, constant: 5).isActive = true
        }
    }
    
    //MARK: - Private properties
    private let models = InfoIcon.getIcons()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        iconsStackView = setup(subiews: createIconViews())
        iconsStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    private func setup(subiews: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: subiews)
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        return stackView
    }
    
    private func createIconViews() -> [UIImageView] {
        var views: [UIImageView] = []
        for model in models {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
            imageView.image = model.icon
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFit
            views.append(imageView)
        }
        return views
    }
    
    private func createInfoLabels() -> [UILabel] {
        var infoLabels: [UILabel] = []
        
        for index in 0..<models.count {
            let label = UILabel()
            label.font = UIFont.installMarkProFont(for: 11)
            label.textColor = .gray
            label.text = titles[index]
            label.textAlignment = .center
            infoLabels.append(label)
        }
        
        return infoLabels
    }
}
