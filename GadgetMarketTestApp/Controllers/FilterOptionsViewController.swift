//
//  FilterOptionsViewController.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 26.08.2022.
//

import UIKit

class FilterOptionsViewController: UIViewController {
    
    //MARK: - Private properties
    private let navigationView = CustomNavigationView()
    private let models = FilterOptionsModel.getData()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(FilterOptionsCell.self, forCellReuseIdentifier: FilterOptionsCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var hasSetPointOrigin = false
    private var pointOrigin: CGPoint?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupContentView()
        setupTableView()
        addTargets()
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = view.frame.origin
        }
    }
    
    //MARK: - Private methods
    private func setupView() {
        view.roundOff(corners: [.topLeft, .topRight], radius: 30)
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(gestureAction))
        view.addGestureRecognizer(gesture)
        view.backgroundColor = .white
        
        view.addSubview(navigationView)
        view.addSubview(tableView)
    }
    
    private func setupContentView() {
        navigationView.configureLayoutForView(parentView: view, topConstant: 0)
    }
    
    private func setupTableView() {
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func addTargets() {
        print(view.frame.height)
        navigationView.dismissButton.addTarget(self, action: #selector(dismissButtonAction), for: .touchUpInside)
        navigationView.doneButton.addTarget(self, action: #selector(dismissButtonAction), for: .touchUpInside)
    }
    
    //MARK: - @objc
    @objc private func gestureAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        guard translation.y >= 0 else { return }
        
        view.frame.origin = CGPoint(x: 0, y: (pointOrigin?.y ?? 0) + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                dismiss(animated: true)
            } else {
                UIView.animate(withDuration: 0.3) { [unowned self] in
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 375)
                }
            }
        }
    }
    
    @objc private func dismissButtonAction() {
        dismiss(animated: true)
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension FilterOptionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FilterOptionsCell.identifier, for: indexPath) as! FilterOptionsCell
        let model = models[indexPath.row]
        cell.textField.text = model.value
        cell.titleLabel.text = model.title
        cell.textField.delegate = self
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}

//MARK: - UITextFieldDelegate
extension FilterOptionsViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let cell = tableView.dequeueReusableCell(withIdentifier: FilterOptionsCell.identifier) as? FilterOptionsCell
        cell?.textField.resignFirstResponder()
        return false
    }
}
