//
//  Interactor_mock.swift
//  NewsReaderTestAppTests
//
//  Created by Anastasija Sergeeva on 18/08/2019.
//  Copyright © 2019 Anastasija Sergeeva. All rights reserved.
//
import Foundation
import UIKit
@testable import NewsReaderTestApp
class NewsInteractor_mock: NewsInteractor {
    
    var rssFeedItems = [NewsItem]()

    override func loadFeed(competionHandler: (([NewsItem]) -> Void)?) {
        rssFeedItems.append(NewsItem(title: "ExampleTitle",
                                      date: "ExampleDate",
                               description: "ExampleDescription",
                                      link: "ExampleLink"))
    }
    
}
