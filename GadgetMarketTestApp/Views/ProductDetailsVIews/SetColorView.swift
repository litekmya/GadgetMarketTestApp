//
//  SetColorView.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 28.08.2022.
//

import UIKit

class SetColorView: UIView {
    
        let colorLabel: UILabel = {
            let label = UILabel()
    
            return label
        }()
        
        let firstColorButton: UIButton = {
            let button = UIButton()
    
            return button
        }()
        let secondColorButton: UIButton = {
            let button = UIButton()
    
            return button
        }()
    
        let firstCapacityButton: UIButton = {
            let button = UIButton()
    
            return button
        }()
        let secondCapacityButton: UIButton = {
            let button = UIButton()
    
            return button
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
        
    }
}
