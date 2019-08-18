//
//  SingleNewsItemViewController.swift
//  NewsReaderTestApp
//
//  Created by Anastasija Sergeeva on 18/08/2019.
//  Copyright © 2019 Anastasija Sergeeva. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class SingleNewsItemViewController: UIViewController {
    
    // MARK: - Properties
    fileprivate var currentUrl: URL
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(currentUrl: URL) {
        self.currentUrl = currentUrl
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let webView = setupWebView()
        webView.load(URLRequest(url: currentUrl, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData))
        let storage = HTTPCookieStorage.shared
        storage.cookieAcceptPolicy = .always
    }
    
    private func setupWebView() -> WKWebView {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.websiteDataStore = .nonPersistent()
        let webView = WKWebView(frame: view.frame, configuration: webConfiguration)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.navigationDelegate = self
        view.addSubview(webView)
        return webView
    }
}

// MARK: - WKNavigationDelegate
extension SingleNewsItemViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        navigationItem.title = webView.title
    }

}
