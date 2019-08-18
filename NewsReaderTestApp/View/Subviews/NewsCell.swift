//
//  NewsCell.swift
//  NewsReaderTestApp
//
//  Created by Anastasija Sergeeva on 18/08/2019.
//  Copyright © 2019 Anastasija Sergeeva. All rights reserved.
//

import Foundation
import UIKit

class NewsCell: UICollectionViewCell {
    
    //MARK: - UIProperties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    //MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    //MARK: - Interface
    func configure(title: String, subtitle: String, description: String) {
        self.titleLabel.text = title
        self.descriptionLabel.text = description

        let delimiter = " "
        var shortString = subtitle.components(separatedBy: delimiter)
        self.dateLabel.text = shortString[0] + " " + shortString[1] + " " + shortString[2]        
    }
    
    //MARK: - Private functions
    private func setupUI() {
        descriptionLabel.textAlignment = .center
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }
}
