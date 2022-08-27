//
//  NetworkManager.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 25.08.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from urlString: String, with completion: @escaping(StoreModel) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Ошибка при получении данных: \(error)")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let model = try JSONDecoder().decode(StoreModel.self, from: data)
                completion(model)
            } catch let error {
                print("Ошибка при парсинге JSON: \(error)")
            }
        }.resume()
    }
}
