//
//  CustomCorouselView.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 30.08.2022.
//

import UIKit
import HSCycleGalleryView

class CarouselView: UIView {
    
    let galleryView: HSCycleGalleryView = {
        let view = HSCycleGalleryView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2 - 140))
        print(UIScreen.main.bounds.height / 2 - 200)
        view.autoScrollInterval = 0
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(galleryView)
        
        setupGalleryView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupGalleryView() {
        galleryView.register(cellClass: ProductDetailsCell.self, forCellReuseIdentifier: ProductDetailsCell.identifier)
        galleryView.delegate = self
        galleryView.reloadData()
    }
}

extension CarouselView: HSCycleGalleryViewDelegate {
    
    func numberOfItemInCycleGalleryView(_ cycleGalleryView: HSCycleGalleryView) -> Int {
        return 3
    }
    
    func cycleGalleryView(_ cycleGalleryView: HSCycleGalleryView, cellForItemAtIndex index: Int) -> UICollectionViewCell {
        let cell = cycleGalleryView.dequeueReusableCell(withIdentifier: ProductDetailsCell.identifier, for: IndexPath(item: index, section: 0)) as! ProductDetailsCell
        cell.backgroundColor = .red
        return cell
    }
}
