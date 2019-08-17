//
//  NewsPresenter.swift
//  NewsReaderTestApp
//
//  Created by Anastasija Sergeeva on 17/08/2019.
//  Copyright © 2019 Anastasija Sergeeva. All rights reserved.
//

import Foundation
////
class NewsPresenter : NSObject, NewsViewControllerOutConnection, NewsInteractorOutConnection {
    var interactor : NewsInteractorInConnection?
    var view: NewsViewControllerInConnection?
}
