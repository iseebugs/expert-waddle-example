//
//  NewsInteractor.swift
//  NewsReaderTestApp
//
//  Created by Anastasija Sergeeva on 17/08/2019.
//  Copyright © 2019 Anastasija Sergeeva. All rights reserved.
//
import UIKit
import Foundation

class NewsInteractor: NSObject, NewsInteractorInConnection {
    
    //MARK: - Properties
    var presenter : NewsInteractorOutConnection!
    fileprivate var rssFeedItems = [NewsItem]()
    fileprivate var feedUrl = NewsFeedConstants.urlString
    fileprivate var currentElement = ""
    fileprivate var currentTitle = ""
    fileprivate var currentDate = ""
    fileprivate var currentDescription = ""
    fileprivate var currentLink = ""
    
    //MARK: - Interactor In
    func loadFeed() {
        self.getRSSFeed()
    }
    
    //MARK: - Private
    fileprivate func getRSSFeed() {
        let request = URLRequest(url: self.feedUrl)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    print(error.localizedDescription)
                    DispatchQueue.main.async { [weak self] in
                        self?.presenter.loadOfflineFeed()
                    }
                }
                return
            }
            let xmlParser = XMLParser(data: data)
            xmlParser.delegate = self
            xmlParser.parse()
        }
        task.resume()
    }
    
}

extension NewsInteractor: XMLParserDelegate {
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?,
                qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if currentElement == NewsFeedConstants.newsItemItem {
            self.currentTitle = ""
            self.currentDate = ""
            self.currentDescription = ""
            self.currentLink = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case NewsFeedConstants.newsItemTitle: currentTitle += string
        case NewsFeedConstants.newsItemPubDate : currentDate += string
        case NewsFeedConstants.newsItemDescription: currentDescription += string
        case NewsFeedConstants.newsItemLink: currentLink += string
        default: break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?,
                qualifiedName qName: String?) {
        if elementName == "item" {
            let item = NewsItem(title: currentTitle, date: currentDate,
                                                 description: currentDescription, link: currentLink)
            self.rssFeedItems.append(item)
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        presenter.updateNewsFeed(self.rssFeedItems)
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError.localizedDescription)
    }
}
