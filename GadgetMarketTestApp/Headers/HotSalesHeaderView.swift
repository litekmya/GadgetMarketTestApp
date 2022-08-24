//
//  HotSalesHeaderView.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 24.08.2022.
//

import UIKit

class HotSalesHeaderView: UICollectionReusableView {
    
    static let identifier = "HotSalesHeaderView"
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.backgroundColor = UIColor.newGray
        searchBar.barTintColor = .white
        searchBar.clipsToBounds = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "searchButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.setupForSection(title: "Hot Sales")
        return label
    }()
    
    let seeMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("see more", for: .normal)
        button.setTitleColor(UIColor.newOrange, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(searchBar)
        addSubview(searchButton)
        addSubview(titleLabel)
        addSubview(seeMoreButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupSearchBar()
        setupSearchButton()
        setupTitleLabel()
        setupViewMoreButton()
    }
    
    private func setupSearchBar() {
        searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        searchBar.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        searchBar.widthAnchor.constraint(equalToConstant: 120).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }
    
    private func setupSearchButton() {
        searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -37).isActive = true
        searchButton.leadingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: 11).isActive = true
        searchButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 34).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }
    
    private func setupTitleLabel() {
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17).isActive = true
        titleLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 24).isActive = true
    }
    
    private func setupViewMoreButton() {
        seeMoreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -33).isActive = true
        seeMoreButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
    }
}
