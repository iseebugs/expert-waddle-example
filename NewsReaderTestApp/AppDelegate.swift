//
//  AppDelegate.swift
//  NewsReaderTestApp
//
//  Created by Anastasija Sergeeva on 17/08/2019.
//  Copyright © 2019 Anastasija Sergeeva. All rights reserved.
//
//import Dip
import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let appDependencies = AppDependencies()

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appDependencies.installRootViewControllerIntoWindow(window!)
        return true
    }

    // MARK: - Core Data stack
    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "NewsDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

