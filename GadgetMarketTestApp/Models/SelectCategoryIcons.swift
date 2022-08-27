//
//  SelectCategoryIcons.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 25.08.2022.
//

import UIKit

struct SelectCategoryIcons {
    var icon: UIImage
    var title: String
    
    static func getData() -> [SelectCategoryIcons] {
        return [SelectCategoryIcons(icon: UIImage(named: "phones") ?? UIImage(), title: "Phones"),
                SelectCategoryIcons(icon: UIImage(named: "computer") ?? UIImage(), title: "Computer"),
                SelectCategoryIcons(icon: UIImage(named: "health") ?? UIImage(), title: "Health"),
                SelectCategoryIcons(icon: UIImage(named: "books") ?? UIImage(), title: "Books"),
                SelectCategoryIcons(icon: UIImage(named: "phones") ?? UIImage(), title: "Phones"),
                SelectCategoryIcons(icon: UIImage(named: "computer") ?? UIImage(), title: "Computer")]
    }
    
    static func getDataWithWhiteIcons() -> [SelectCategoryIcons] {
        return [SelectCategoryIcons(icon: UIImage(named: "phonesWhite") ?? UIImage(), title: "Phones"),
                SelectCategoryIcons(icon: UIImage(named: "computerWhite") ?? UIImage(), title: "Computer"),
                SelectCategoryIcons(icon: UIImage(named: "healthWhite") ?? UIImage(), title: "Health"),
                SelectCategoryIcons(icon: UIImage(named: "booksWhite") ?? UIImage(), title: "Books"),
                SelectCategoryIcons(icon: UIImage(named: "phonesWhite") ?? UIImage(), title: "Phones"),
                SelectCategoryIcons(icon: UIImage(named: "computerWhite") ?? UIImage(), title: "Computer")]
    }
}
