//
//  Constants.swift
//  NewsReaderTestApp
//
//  Created by Anastasija Sergeeva on 18/08/2019.
//  Copyright © 2019 Anastasija Sergeeva. All rights reserved.
//

import Foundation
import UIKit

struct NewsFeedConstants {
    
    static var title: String {
        return "News"
    }
    
    static var urlString: URL {                      //https://developer.apple.com/news/rss/news.rss
        return URL(string:"https://news.yandex.com/science.rss")!
    }
 
    static var cellHeight: CGFloat {
        return 100.0
    }

    static var cellInteritemSpace: CGFloat {
        return 10.0
    }

    static var newsItemTitle: String {
        return "title"
    }

    static var newsItemPubDate: String {
        return "pubDate"
    }

    static var newsItemDescription: String {
        return "description"
    }
    
    static var newsItemLink: String {
        return "link"
    }
    
    static var newsItemItem: String {
        return "item"
    }
}
