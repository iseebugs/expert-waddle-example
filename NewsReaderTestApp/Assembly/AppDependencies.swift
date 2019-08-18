//
//  AppDependencies.swift
//  NewsReaderTestApp
//
//  Created by Anastasija Sergeeva on 17/08/2019.
//  Copyright © 2019 Anastasija Sergeeva. All rights reserved.
//

import Foundation

import UIKit

class AppDependencies {
    var container = NewsContainer()
    
    init() {
        configureDependencies()
    }
    
    func installRootViewControllerIntoWindow(_ window: UIWindow) {
        container.presentNewsInterfaceFromWindow(window)
    }
    
    func configureDependencies() {
        let rootContainer = RootContainer()
        let newsVC = NewsViewController()
        let newsPresenter = NewsPresenter()
        let newsInteractor = NewsInteractor()
        newsInteractor.presenter = newsPresenter
        newsVC.presenter = newsPresenter
        newsPresenter.interactor = newsInteractor
        container.newsPresenter = newsPresenter
        container.rootContainer = rootContainer
    }
}
