//
//  UICollectionView+Nib.swift
//  NewsReaderTestApp
//
//  Created by Anastasija Sergeeva on 18/08/2019.
//  Copyright © 2019 Anastasija Sergeeva. All rights reserved.
//

import UIKit
import Foundation

extension UICollectionView {

public func register<T: UICollectionViewCell>(cellClass class: T.Type) {
    self.register(`class`, forCellWithReuseIdentifier: `class`.defaultIdentifier())
}

public func registerNib<T: UICollectionViewCell>(cellClass class: T.Type) {
    self.register(UINib(nibName: String(describing: `class`), bundle: nil), forCellWithReuseIdentifier: `class`.defaultIdentifier())
}

func dequeueReusableCell<T: UICollectionViewCell>(withClass class: T.Type, forIndexPath indexPath: IndexPath) -> T {
    guard let cell = self.dequeueReusableCell(withReuseIdentifier: `class`.defaultIdentifier(), for: indexPath) as? T else {
        fatalError("Error: cell with identifier: \(`class`.defaultIdentifier()) for index path: \(indexPath) is not \(T.self)")
    }
    return cell
}
}

extension UICollectionViewCell {
    public class func defaultIdentifier() -> String {
        return NSStringFromClass(self)
    }
}
