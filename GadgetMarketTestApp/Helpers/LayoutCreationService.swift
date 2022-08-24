//
//  LayoutCreationService.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 24.08.2022.
//

import Foundation
import UIKit

class LayoutCreationService {
    
    //MARK: - Select category
    static func selectCategoryLayout(with kind: String) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(71),
                                              heightDimension: .absolute(93))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let zeroSpacing = NSCollectionLayoutSpacing.fixed(0)
        let neededSpacing = NSCollectionLayoutSpacing.fixed(11.5)
        
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: neededSpacing, top: zeroSpacing, trailing: neededSpacing, bottom: zeroSpacing)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2),
                                               heightDimension: .absolute(93))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 24, leading: 15.5, bottom: 35, trailing: 15.5)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(50)),
             elementKind: kind,
             alignment: .topLeading)
        ]
        return section
    }
    
    //MARK: - Hot sales
    static func makeHotSalesLayout(with kind: String) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.leading = 15
        item.contentInsets.trailing = 21
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(182))
        print(groupSize.widthDimension)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        section.contentInsets.bottom = 15
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(165)), elementKind: kind, alignment: .topLeading)
        ]
        return section
    }
    
    //MARK: - Best seller
    static func makeBestSellerLayout(with kind: String) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(227))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.leading = 11
        item.contentInsets.bottom = 12
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets.leading = 6
        group.contentInsets.trailing = 35
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 18, leading: 0, bottom: 24, trailing: 0)
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(20)),
                elementKind: kind, alignment: .topLeading)
        ]

        return section
    }
}
// 11 - 32 - 16
