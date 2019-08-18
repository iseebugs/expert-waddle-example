//
//  ApplicationContainer.swift
//  NewsReaderTestApp
//
//  Created by Anastasija Sergeeva on 17/08/2019.
//  Copyright © 2019 Anastasija Sergeeva. All rights reserved.

let NewsViewControllerIdentifier = "NewsViewController"

import Foundation
import UIKit

class NewsContainer: NSObject {
    
    var newsPresenter : NewsPresenter!
    var rootContainer : RootContainer?
    var newsViewController : NewsViewController?
    
    func presentNewsInterfaceFromWindow(_ window: UIWindow) {
        let viewController = newsViewControllerFromStoryboard()
        viewController.presenter = newsPresenter
        newsViewController = viewController
        newsViewController?.presenter = newsPresenter
        newsPresenter?.view = viewController as? NewsViewControllerInConnection
        rootContainer?.showRootViewController(viewController, inWindow: window)
    }
    
    func newsViewControllerFromStoryboard() -> NewsViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewController(withIdentifier: NewsViewControllerIdentifier) as! NewsViewController
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard
    }
    
}
