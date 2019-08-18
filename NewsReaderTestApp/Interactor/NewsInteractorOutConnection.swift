//
//  NewsInteractorOutConnection.swift
//  NewsReaderTestApp
//
//  Created by Anastasija Sergeeva on 18/08/2019.
//  Copyright © 2019 Anastasija Sergeeva. All rights reserved.
//

import Foundation
protocol NewsInteractorOutConnection {
    
    func updateNewsFeed(_ news: [NewsItem])
    
}
