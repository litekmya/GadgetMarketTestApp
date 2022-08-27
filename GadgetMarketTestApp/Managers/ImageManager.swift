//
//  ImageManager.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 25.08.2022.
//

import Foundation
import UIKit

class ImageManager {
    
    static let shared = ImageManager()
    
    private init() {}
    
    func getImage(from urlString: String, with completion: @escaping(UIImage) -> Void) {
        guard let url = URL(string: urlString) else {
            print("yyy")
            return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Ошибка при получении изображения: \(error)")
                return
            }
            
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            
            completion(image)
        }.resume()
    }
}
