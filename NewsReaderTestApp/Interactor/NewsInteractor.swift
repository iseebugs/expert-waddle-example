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
    fileprivate var completion: (([NewsItem]) -> Void)?
    fileprivate var feedUrl = NewsFeedConstants.urlString
    fileprivate var currentElement = ""
    fileprivate var currentTitle = ""
    fileprivate var currentDate = ""
    fileprivate var currentDescription = ""

    //MARK: - Life Cycle
    
    
    //MARK: - Interactor In
    func loadFeed(competionHandler: (([NewsItem]) -> Void)?) {
        self.getRSSFeed(competionHandler: competionHandler)
    }
    
    //MARK: - Interactor Out

    
    //MARK: - Private
    fileprivate func getRSSFeed(competionHandler: (([NewsItem]) -> Void)?) {
        self.completion = competionHandler
        let request = URLRequest(url: self.feedUrl)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                
                if let error = error {
                    print(error.localizedDescription)
                }
                
                return
            }
            let xmlParser = XMLParser(data: data)
            print(data)
            xmlParser.delegate = self
            xmlParser.parse()
        }
        task.resume()
        
    }
    

}

extension NewsInteractor: XMLParserDelegate {
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?,
                  qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        print(elementName)
        currentElement = elementName
        if currentElement == "item" {
            self.currentTitle = ""
            self.currentDate = ""
            self.currentDescription = ""
        }
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "title": currentTitle += string; print(string + "💙")
        case "pubDate": currentDate += string
        case "description": currentDescription += string
        default: break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?,
                                                                     qualifiedName qName: String?) {
        if elementName == "item" {
            let item = NewsItem(title: currentTitle, date: currentDate,
                                                                    description: currentDescription)
            self.rssFeedItems.append(item)
            print("ITEM 🔥")
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        completion?(self.rssFeedItems)
        presenter.updateNewsFeed(self.rssFeedItems)
        print(self.rssFeedItems.count)
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        
    }
}
