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
        return "Apple Dev News"
    }
    
    static var urlString: URL {
        return URL(string:"https://news.yandex.com/science.rss")!
            //"https://developer.apple.com/news/rss/news.rss")!
    }
 
    
//    static var image: UIImage {
//        return #imageLiteral(resourceName: "top")
//    }
//

//    static var buttonTitle: String {
//        return TFLLocalizedString("chat_activate_vip")
//    }
//
//    static var showEvent: String {
//        return "tutorial_popup_vip_status_show"
//    }
//
//    static var actionEvent: String {
//        return "tutorial_popup_vip_status_button_pressed"
//    }
}
