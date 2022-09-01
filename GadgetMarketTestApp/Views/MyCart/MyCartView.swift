//
//  MyCartView.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 31.08.2022.
//

import UIKit

class MyCartView: UIView {
    
    //MARK: - Public properties
    var phones: [Phone] = [] {
        didSet {
            getTotalPrice()
        }
    }
    let cartTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .newDarkBlue
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let totalView = TotalView()
    
    let checkoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Checkout", for: .normal)
        button.titleLabel?.font = .installMarkProFont(for: 20)
        button.layer.cornerRadius = 10
        button.backgroundColor = .newOrange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    private func customizeUI() {
        backgroundColor = .newDarkBlue
        addSubview(checkoutButton)
        addSubview(totalView)
        addSubview(cartTableView)
        
        setupCheckoutButton()
        setupTotalView()
        setupTableView()
        getTotalPrice()
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
        cartTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cartTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        cartTableView.bottomAnchor.constraint(equalTo: totalView.topAnchor).isActive = true
        cartTableView.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.register(MyCartCell.self, forCellReuseIdentifier: MyCartCell.indentifier)
    }
    
    private func getTotalPrice() {
        if phones.count != 0 {
            var totalPrice = 0
            
            for phone in phones {
                totalPrice += phone.price
            }
            
            totalView.totalActiveLabel.text = "$\(totalPrice) us"
        } else {
            totalView.totalActiveLabel.text = "$0 us"
        }
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension MyCartView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        phones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyCartCell.indentifier, for: indexPath) as! MyCartCell
        let phone = phones[indexPath.row]
        
        cell.priceLabel.text = "$\(phone.price) us"
        cell.titleLabel.text = phone.title
        cell.selectionStyle = .none
        
        guard let imageString = phone.images.first else { return cell }
        
        ImageManager.shared.getImage(from: imageString) { image in
            DispatchQueue.main.async {
                cell.iconImageView.image = image
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
