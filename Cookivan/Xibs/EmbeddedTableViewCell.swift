//
//  RecipesTableViewCell.swift
//  Cookivan
//
//  Created by Angelina on 7/29/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit

class EmbeddedTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
//        collectionView.dataSource = self
//        collectionView.delegate = self
        let nib = UINib(nibName: "RecipesCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "collectionViewID")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

//    func collectionReloadData(){
//        DispatchQueue.main.async(execute: {
//            self.collectionView.reloadData()
//        })
//    }
}

// MARK: - Set up CollectionView DataSourse & Delegate
extension EmbeddedTableViewCell {
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(
        _ dataSourseDelegate: D, forRow row: Int) {
        collectionView.delegate = dataSourseDelegate
        collectionView.dataSource = dataSourseDelegate
        collectionView.contentOffset = .zero
//        collectionView.reloadData()
    }
}
