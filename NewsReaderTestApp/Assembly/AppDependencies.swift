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
        //let coreDataStore = CoreDataStore()
        //let clock = DeviceClock()
        let rootContainer = RootContainer()
        let newsVC = NewsViewController()

        let newsPresenter = NewsPresenter()
       // let listDataManager = ListDataManager()
        let newsInteractor = NewsInteractor()//dataManager: listDataManager, clock: clock)
        
       // let addWireframe = AddWireframe()
      //  let addInteractor = AddInteractor()
    //    let addPresenter = AddPresenter()
      //  let addDataManager = AddDataManager()
        
        newsInteractor.presenter = newsPresenter
        newsVC.presenter = newsPresenter
        newsPresenter.interactor = newsInteractor
       // listPresenter.container = container
        
        container.newsPresenter = newsPresenter
        container.rootContainer = rootContainer
       // container.newsViewController = 
        //listDataManager.coreDataStore = coreDataStore
        
        //addInteractor.addDataManager = addDataManager
        
       // addWireframe.addPresenter = addPresenter
        
      //  addPresenter.addWireframe = addWireframe
      //  addPresenter.addModuleDelegate = listPresenter
        //addPresenter.addInteractor = addInteractor
        
    ///    addDataManager.dataStore = coreDataStore
    }
}
