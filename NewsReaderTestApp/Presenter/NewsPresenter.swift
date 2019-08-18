//
//  NewsPresenter.swift
//  NewsReaderTestApp
//
//  Created by Anastasija Sergeeva on 17/08/2019.
//  Copyright © 2019 Anastasija Sergeeva. All rights reserved.
//
import UIKit
import Foundation

class NewsPresenter : NSObject, NewsViewControllerOutConnection, NewsInteractorOutConnection {

    //MARK: - Properties
    var interactor : NewsInteractorInConnection!
    var view: NewsViewControllerInConnection!
    var newsItems = [NewsItem]()
    
    //MARK: - View Out
    func viewIsReady() {
        interactor.loadFeed(competionHandler: nil)
    }
    
    func pullToRefreshReleased() {
    }
    
    func configureCell(indexPath: IndexPath, cell: NewsCell) -> UICollectionViewCell {
        let item = self.newsItems[indexPath.row]
        cell.configure(title: item.title, subtitle: item.date, description: item.description)
        return cell
    }
    
    func getNumberOfCells() -> Int {
        return newsItems.count
    }
    
    func cellDidPress(_ indexPath: IndexPath) {
        
    }
    
    //MARK: - Interactor In
    
    
    //MARK: - Interactor Out
    func updateNewsFeed(_ news: [NewsItem]) {
        self.newsItems = news
        view.reload()
    }


}
