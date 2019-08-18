//
//  ViewController.swift
//  NewsReaderTestApp
//
//  Created by Anastasija Sergeeva on 17/08/2019.
//  Copyright © 2019 Anastasija Sergeeva. All rights reserved.
//
import UIKit

class NewsViewController: UIViewController, NewsViewControllerInConnection {
    
    //MARK: - Properties
    var presenter: NewsViewControllerOutConnection!
    var refreshControl = UIRefreshControl()

    //MARK: - UIProperties
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "NewsCell", bundle: .main),
                                                             forCellWithReuseIdentifier: "NewsCell")
        presenter.viewIsReady()
        setupUI()
    }
    
    //MARK: - View In
    func reload() {
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
            self?.refreshControl.endRefreshing()
        }
    }
    
    func showWebView(vc: UIViewController) {
        self.navigationController?.show(vc, sender: nil)
    }
    
    
    //MARK: - Private functions
    fileprivate func setupUI() {
        self.title = NewsFeedConstants.title
        collectionView.dataSource = self
        collectionView.delegate = self
        refreshControl.attributedTitle = NSAttributedString(string: "updating")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        refreshControl.tintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        collectionView.addSubview(refreshControl)
    }
    
    @objc func refresh() {
        presenter.viewIsReady()
    }

}

//MARK:- Collection View Data Source
extension NewsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return presenter.getNumberOfCells()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath)
        return presenter.configureCell(indexPath: indexPath, cell: cell as! NewsCell)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        presenter.cellDidPress(indexPath)
    }
        
}

extension NewsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.bounds.width,
                         height: NewsFeedConstants.cellHeight)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return NewsFeedConstants.cellInteritemSpace
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return NewsFeedConstants.cellInteritemSpace
    }
}
