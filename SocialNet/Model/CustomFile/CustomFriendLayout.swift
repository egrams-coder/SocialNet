//
//  CustomFriendLayout.swift
//  SocialNet
//
//  Created by Роман Евтюхин on 02.11.2020.
//

import UIKit

class CustomFriendLayout: UICollectionViewLayout {
    
    var cacheAttributes = [IndexPath: UICollectionViewLayoutAttributes]()
    
    var columnsCount = 2 // Количество столбцов (в строке будет максимум две картинки)
    
    var totalCellHeight: CGFloat = 0 // Общая высота ячеек (по умолчанию = 0)
    
    // Метод настройки ячеек
    override func prepare() {
        
        self.cacheAttributes = [:]
        // Проверки на nil
        guard let collectionView = self.collectionView else { return }
        
        let itemCount = collectionView.numberOfItems(inSection: 0)
        
        guard itemCount > 0 else { return }
        
        let cellSize = (collectionView.frame.width - 15) / CGFloat(columnsCount) // Базовая ширина ячейки (делим ширину на количество столбцов) (- 15 это сдвиги общая цифра)
        
        // начальные точки по оси x и y
        var lastY: CGFloat = 5
        var lastX: CGFloat = 5
        
        // перебираем количество элементов в секции itemCount
        for index in 0..<itemCount {
            
            let indexPath = IndexPath(item: index, section: 0)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            attributes.frame = CGRect(x: lastX, y: lastY, width: cellSize, height: cellSize)
            
            let isLastColumn = index % self.columnsCount - 1 == 0
            
            if isLastColumn {
                lastY += cellSize + 5
                lastX = 5
            } else {
                lastX += cellSize + 5
            }
            cacheAttributes[indexPath] = attributes
            totalCellHeight = lastY
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cacheAttributes.values.filter { (attr) in
            return rect.intersects(attr.frame)
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cacheAttributes[indexPath]
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: self.collectionView?.frame.width ?? 0, height: self.totalCellHeight)
    }
}
