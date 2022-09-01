//
//  FilterOptionsModel.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 27.08.2022.
//

import Foundation

struct FilterOptionsModel {
    var title: String
    var value: String
    
    static func getData() -> [FilterOptionsModel] {
        return [FilterOptionsModel(title: "Brand", value: "Samsung"),
                FilterOptionsModel(title: "Price", value: "$0 - $10000"),
                FilterOptionsModel(title: "Size", value: "4.5 to 5.5 inches")]
    }
}
