//
//  NewsItem.swift
//  NewsReaderTestApp
//
//  Created by Anastasija Sergeeva on 18/08/2019.
//  Copyright © 2019 Anastasija Sergeeva. All rights reserved.
//

import Foundation

struct NewsItem {
    
    var title: String = "" {
        didSet {
            title = title.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    var date: String = ""  {
        didSet {
            date = date.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    var description: String = "" {
        didSet {
            description = description.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    var link: String = ""

}
