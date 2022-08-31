//
//  CustomCorouselView.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 30.08.2022.
//

import UIKit
import HSCycleGalleryView

class CarouselView: UIView {
    
    var images: [UIImage] = [] {
        didSet {
            galleryView.reloadData()
        }
    }
    
    let galleryView: HSCycleGalleryView = {
        let view = HSCycleGalleryView(frame: CGRect(
            x: 0,
            y: 0,
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height / 2.8)
        )
        view.autoScrollInterval = 0
        view.contentBackgroundColor = .newGray
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
        if images.count == 0 {
            return 4
        } else {
            return images.count
        }
        
    }
    
    func cycleGalleryView(_ cycleGalleryView: HSCycleGalleryView, cellForItemAtIndex index: Int) -> UICollectionViewCell {
        let cell = cycleGalleryView.dequeueReusableCell(withIdentifier: ProductDetailsCell.identifier, for: IndexPath(item: index, section: 0)) as! ProductDetailsCell
        if images.count == 0 {
            return cell
        }
        
        let image = images[index]
        
        cell.mainImageView.image = image
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 20
        return cell
    }
}
