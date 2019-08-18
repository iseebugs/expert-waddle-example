//
//  NewsPresenter.swift
//  NewsReaderTestApp
//
//  Created by Anastasija Sergeeva on 17/08/2019.
//  Copyright © 2019 Anastasija Sergeeva. All rights reserved.
//
import UIKit
import WebKit
import CoreData
import Foundation

class NewsPresenter : NSObject, NewsViewControllerOutConnection, NewsInteractorOutConnection {

    //MARK: - Properties
    var interactor : NewsInteractorInConnection!
    var view: NewsViewControllerInConnection!
    var newsItems = [NewsItem]()
    
    //MARK: - View Out
    func viewIsReady() {
        interactor.loadFeed()
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
        let item = self.newsItems[indexPath.row]
        let delimiter = "?"
        let newstr = item.link
        var shortString = newstr.components(separatedBy: delimiter)
        guard let link = URL(string: shortString[0]) else { return }
        let vc = SingleNewsItemViewController(currentUrl: link)
        view.showWebView(vc: vc)
    }
    
    //MARK: - Interactor Out
    func updateNewsFeed(_ news: [NewsItem]) {
        self.newsItems = news
        DispatchQueue.main.async { [weak self] in
            self?.view.reload()
            self?.saveFeed()
        }
    }
    
    func loadOfflineFeed() {
        var savedItems = [NewsCellContent]()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NewsCellContent> = NewsCellContent.fetchRequest()
        do {
            savedItems = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
        for item in savedItems {
            let item = NewsItem(title: item.title ?? "", date: item.date ?? "",
                                                description: item.text ?? "", link: item.link ?? "")
            self.newsItems.append(item)
        }
        self.view.reload()
    }
                         //TODO: NewsItem и NewsCellContent надо было объединить в одну модель сразу
    //MARK: - Private
    private func saveFeed() {
        for item in newsItems {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "NewsCellContent", in: context)
            let newsItemObject = NSManagedObject(entity: entity!, insertInto: context) as! NewsCellContent
            newsItemObject.title = item.title
            newsItemObject.date = item.date
            newsItemObject.text = item.description
            newsItemObject.link = item.link
            do {
                try context.save()
            } catch {
                print("saving error")
            }
        }
    }
    
}
