//
//  MainCollectionView.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 27.08.2022.
//

import UIKit

class MainCollectionView: UICollectionView {
    
    static let reuseHeaderID = "selectCategoryHeaderID"
    static let hotSalesHeaderID = "hotSalesHeaderID"
    
    weak var mainDelegate: MainCollectionViewDelegate!
    var models: StoreModel?
    
    //MARK: - Private properties
    private let whiteIconsModels = SelectCategoryIcons.getDataWithWhiteIcons()
    private let grayIconsModels = SelectCategoryIcons.getData()
    private var isSelected = false
    
    //MARK: - Lifecycle
    init(mainDelegate: MainCollectionViewDelegate) {
        super.init(frame: .zero, collectionViewLayout: MainCollectionView.createLayout())
        
        self.mainDelegate = mainDelegate
        delegate = self
        dataSource = self
        backgroundColor = .newGray
        
        registerTheRequiredObjets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func createLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { sectionIndex, layoutEnvirement in
            
            switch sectionIndex {
            case 0:
                return LayoutCreationService.selectCategoryLayout(with: reuseHeaderID)
            case 1:
                return LayoutCreationService.makeHotSalesLayout(with: hotSalesHeaderID)
            default:
                return LayoutCreationService.makeBestSellerLayout(with: reuseHeaderID)
            }
        }
    }
    
    //MARK: - Private methods
    private func checkBackgroundColor() {
        for index in 0..<whiteIconsModels.count {
            let indexPath = IndexPath(row: index, section: 0)
            let cell = cellForItem(at: indexPath) as? SelectCategoryCell
            cell?.iconView.backgroundColor = UIColor.white
            
            if cell?.iconView.backgroundColor == .white {
                cell?.imageView.image = grayIconsModels[index].icon
            }
        }
    }
    
    private func changeBackgroudColorForItem(at indexPath: IndexPath, isSelected: Bool) {
        let cell = cellForItem(at: indexPath) as? SelectCategoryCell
        
        if isSelected {
            let model = whiteIconsModels[indexPath.row]
            cell?.iconView.backgroundColor = .newOrange
            cell?.imageView.image = model.icon
        } else {
            let model = grayIconsModels[indexPath.row]
            cell?.iconView.backgroundColor = UIColor.white
            cell?.imageView.image = model.icon
        }
        
        self.isSelected.toggle()
    }
}

//MARK: - UICollectionViewDataSource
extension MainCollectionView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 6
        case 1: return models?.home_store.count ?? 0
        default: return models?.best_seller.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectCategoryCell.identifier, for: indexPath) as! SelectCategoryCell
            let model = grayIconsModels[indexPath.row]
            
            cell.imageView.image = model.icon
            cell.titleLabel.text = model.title
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotSalesCell.identifier, for: indexPath) as! HotSalesCell
            guard let model = models?.home_store[indexPath.row] else { return cell }
            cell.titleLabel.text = model.title
            cell.descriptionLabel.text = model.subtitle
            
            if model.is_new ?? false {
                cell.isNewImageView.isHidden = false
            }
            
// Так как на данном изображении уже присутствует название модели, я решил добавить код, который будет скрывать title. Но так же я понимаю, что в продакшене нельзя оставлять его, так как изображения будут переодически изменяться. И в принципе в продакшене по идее не должно быть изображений такого рода. Оставляю на ваше расмотрение
//            if model.title == "Samsung Galaxy A71" {
//                cell.titleLabel.isHidden = true
//            }
            ImageManager.shared.getImage(from: model.picture ?? "") { image in
                DispatchQueue.main.async {
                    cell.iconImageView.image = image
                }
            }
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestSellerCell.identifier, for: indexPath) as! BestSellerCell
            guard let model = models?.best_seller[indexPath.row] else { return cell }
            guard let discontPrice = model.discount_price else { return cell }
            guard let price = model.price_without_discount else { return cell }
            
            cell.titleLabel.text = model.title
            cell.discountPriceLabel.text = "$\(discontPrice)"
            cell.priceLabel.attributedText = "$\(price)".strikeThrough()
            if model.is_favorites ?? false {
                cell.isFavoriteButton.setImage(UIImage(named: "isFavoriteFull"), for: .normal)
            }
            
            ImageManager.shared.getImage(from: model.picture ?? "") { image in
                DispatchQueue.main.async {
                    cell.iconImageView.image = image
                }
            }
            return cell
        }
    }
}

//MARK: - UICollectionViewDelegate
extension MainCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            isSelected.toggle()
            
            checkBackgroundColor()
            changeBackgroudColorForItem(at: indexPath, isSelected: isSelected)
        case 1: break
        default:
            mainDelegate?.present()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ReuseHeaderView.identifier, for: indexPath) as! ReuseHeaderView
            header.label.text = "Select Category"
            header.viewAllButton.setTitle("view all", for: .normal)
            return header
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HotSalesHeaderView.identifier, for: indexPath) as! HotSalesHeaderView
            return header
        case 2:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ReuseHeaderView.identifier, for: indexPath) as! ReuseHeaderView
            
            header.viewAllButton.setTitle("see more", for: .normal)
            header.label.text = "Best Seller"
            return header
        default: return UICollectionReusableView()
        }
    }
}
