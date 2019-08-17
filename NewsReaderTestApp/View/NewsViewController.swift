//
//  ViewController.swift
//  NewsReaderTestApp
//
//  Created by Anastasija Sergeeva on 17/08/2019.
//  Copyright © 2019 Anastasija Sergeeva. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, NewsViewControllerInConnection {

    var presenter : NewsViewControllerOutConnection?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

