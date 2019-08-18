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
        collectionView.register(UINib(nibName: "NewsCell", bundle: .main), forCellWithReuseIdentifier: "NewsCell")  //registerNib(cellClass: NewsCell.self)
        setupUI()
        presenter.viewIsReady()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//    }
    
    //MARK: - View In
    func reload() {
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    //MARK: - View out
    
    
    //MARK: - Private functions
    fileprivate func setupUI() {
        self.title = NewsFeedConstants.title
        collectionView.dataSource = self
        collectionView.delegate = self

       // self.setupPhotofeedView()
       // titleLabel.text = TFLLocalizedString("people_nearby_access_to_location_description")
       // actionButton.setTitle(TFLLocalizedString("general_allow"), for: .normal)
    }
    

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
    

//    func collectionView(_ collectionView: UICollectionView,
//                        shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
//        return presenter.shouldShowMenuForItemAtIndexPath(indexPath)
//    }
    
}
