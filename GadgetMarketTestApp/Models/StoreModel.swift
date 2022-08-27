//
//  StoreModel.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 25.08.2022.
//

import Foundation

struct StoreModel: Decodable {
    let home_store: [HomeStore]
    let best_seller: [BestSeller]
}

struct HomeStore: Decodable {
    let id: Int
    let is_new: Bool?
    let title: String?
    let subtitle: String?
    let picture: String?
    let is_buy: Bool?
}

struct BestSeller: Decodable {
    let id: Int
    let is_favorites: Bool?
    let title: String?
    let price_without_discount: Int?
    let discount_price: Int?
    let picture: String?
}
