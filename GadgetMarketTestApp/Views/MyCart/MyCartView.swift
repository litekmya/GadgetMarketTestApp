//
//  MyCartView.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 31.08.2022.
//

import UIKit

class MyCartView: UIView {
    
    let cartTableView: UITableView = UITableView(frame: .zero, style: .grouped)
    
    let checkoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Checkout", for: .normal)
        button.titleLabel?.font = .installMarkProFont(for: 20)
        button.layer.cornerRadius = 10
        button.backgroundColor = .newOrange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let totalView = TotalView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customizeUI()
    }
    
    private func customizeUI() {
        backgroundColor = .newDarkBlue
        addSubview(checkoutButton)
        addSubview(totalView)
        addSubview(cartTableView)
        
        setupCheckoutButton()
        setupTotalView()
        setupTableView()
    }
    
    private func setupCheckoutButton() {
        checkoutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 44).isActive = true
        checkoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -44).isActive = true
        checkoutButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -44).isActive = true
        checkoutButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
    }
    
    private func setupTotalView() {
        totalView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        totalView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        totalView.bottomAnchor.constraint(equalTo: checkoutButton.topAnchor, constant: -25).isActive = true
        totalView.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    private func setupTableView() {
        cartTableView.translatesAutoresizingMaskIntoConstraints = false
        cartTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cartTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        cartTableView.bottomAnchor.constraint(equalTo: totalView.topAnchor).isActive = true
        cartTableView.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.register(MyCartCell.self, forCellReuseIdentifier: MyCartCell.indentifier)
        cartTableView.backgroundColor = .newDarkBlue
    }
}

extension MyCartView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyCartCell.indentifier, for: indexPath) as! MyCartCell
        cell.iconImageView.image = UIImage(systemName: "star")
        cell.priceLabel.text = "$3000"
        cell.titleLabel.text = "Samsung Note 20S Ultra"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
