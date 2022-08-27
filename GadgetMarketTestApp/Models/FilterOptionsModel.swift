//
//  FilterOptionsModel.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 27.08.2022.
//

import Foundation

struct FilterOptionsModel {
    var title: String
    
    static func getData() -> [FilterOptionsModel] {
        return [FilterOptionsModel(title: "Brand"),
                FilterOptionsModel(title: "Price"),
                FilterOptionsModel(title: "Size")]
    }
}
