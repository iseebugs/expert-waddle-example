//
//  NewsViewControllerOutConnection.swift
//  NewsReaderTestApp
//
//  Created by Anastasija Sergeeva on 18/08/2019.
//  Copyright © 2019 Anastasija Sergeeva. All rights reserved.
//

import UIKit
import Foundation

protocol NewsViewControllerOutConnection {
    
    func viewIsReady()

    func pullToRefreshReleased()
  //  func viewDidLayoutSubviews()
    
    func configureCell(indexPath: IndexPath, cell: NewsCell) -> UICollectionViewCell

    func getNumberOfCells() -> Int
    
    func cellDidPress(_ indexPath: IndexPath)

}
