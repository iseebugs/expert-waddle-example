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

    //MARK: - UIProperties
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "NewsCell", bundle: .main),
                                                             forCellWithReuseIdentifier: "NewsCell")
        setupUI()
        presenter.viewIsReady()
    }
    
    //MARK: - View In
    func reload() {
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
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
    }
    
    //MARK: - View out
    //MARK: - Actions

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
        let size = CGSize(width: collectionView.bounds.width - 5, height: NewsFeedConstants.cellHeight)
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
