//
//  MainRecipesVC.swift
//  Cookivan
//
//  Created by Angelina on 7/29/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit

class MainRecipesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let sectionTitles = ["Новинки недели", "Рецепты", "Для мультиварки", "Кухни мира", "Здоровое питание", "Кулинарные новости", "Советы", "Диеты"]

    let plainTableViewCellData: [[UIImage]] = [[#imageLiteral(resourceName: "37")], [#imageLiteral(resourceName: "1")], [#imageLiteral(resourceName: "26")]]

    let collectionViewCellData: [[UIImage]] = [
        [#imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "30"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "20"), #imageLiteral(resourceName: "37"), #imageLiteral(resourceName: "21"), #imageLiteral(resourceName: "28"), #imageLiteral(resourceName: "10"), #imageLiteral(resourceName: "24"), #imageLiteral(resourceName: "27"), #imageLiteral(resourceName: "16"), #imageLiteral(resourceName: "26"), #imageLiteral(resourceName: "33"), #imageLiteral(resourceName: "35") ],
        [#imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "30"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "20"), #imageLiteral(resourceName: "37"), #imageLiteral(resourceName: "21"), #imageLiteral(resourceName: "28"), #imageLiteral(resourceName: "10"), #imageLiteral(resourceName: "24"), #imageLiteral(resourceName: "27"), #imageLiteral(resourceName: "16"), #imageLiteral(resourceName: "26"), #imageLiteral(resourceName: "33"), #imageLiteral(resourceName: "35") ],
        [#imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "30"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "20"), #imageLiteral(resourceName: "37"), #imageLiteral(resourceName: "21"), #imageLiteral(resourceName: "28"), #imageLiteral(resourceName: "10"), #imageLiteral(resourceName: "24"), #imageLiteral(resourceName: "27"), #imageLiteral(resourceName: "16"), #imageLiteral(resourceName: "26"), #imageLiteral(resourceName: "33"), #imageLiteral(resourceName: "35") ],
        [#imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "30"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "20"), #imageLiteral(resourceName: "37"), #imageLiteral(resourceName: "21"), #imageLiteral(resourceName: "28"), #imageLiteral(resourceName: "10"), #imageLiteral(resourceName: "24"), #imageLiteral(resourceName: "27"), #imageLiteral(resourceName: "16"), #imageLiteral(resourceName: "26"), #imageLiteral(resourceName: "33"), #imageLiteral(resourceName: "35") ],
        [#imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "30"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "20"), #imageLiteral(resourceName: "37"), #imageLiteral(resourceName: "21"), #imageLiteral(resourceName: "28"), #imageLiteral(resourceName: "10"), #imageLiteral(resourceName: "24"), #imageLiteral(resourceName: "27"), #imageLiteral(resourceName: "16"), #imageLiteral(resourceName: "26"), #imageLiteral(resourceName: "33"), #imageLiteral(resourceName: "35") ],
        [#imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "30"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "20"), #imageLiteral(resourceName: "37"), #imageLiteral(resourceName: "21"), #imageLiteral(resourceName: "28"), #imageLiteral(resourceName: "10"), #imageLiteral(resourceName: "24"), #imageLiteral(resourceName: "27"), #imageLiteral(resourceName: "16"), #imageLiteral(resourceName: "26"), #imageLiteral(resourceName: "33"), #imageLiteral(resourceName: "35") ],
        [#imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "30"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "20"), #imageLiteral(resourceName: "37"), #imageLiteral(resourceName: "21"), #imageLiteral(resourceName: "28"), #imageLiteral(resourceName: "10"), #imageLiteral(resourceName: "24"), #imageLiteral(resourceName: "27"), #imageLiteral(resourceName: "16"), #imageLiteral(resourceName: "26"), #imageLiteral(resourceName: "33"), #imageLiteral(resourceName: "35") ],
        [#imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "30"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "20"), #imageLiteral(resourceName: "37"), #imageLiteral(resourceName: "21"), #imageLiteral(resourceName: "28"), #imageLiteral(resourceName: "10"), #imageLiteral(resourceName: "24"), #imageLiteral(resourceName: "27"), #imageLiteral(resourceName: "16"), #imageLiteral(resourceName: "26"), #imageLiteral(resourceName: "33"), #imageLiteral(resourceName: "35") ],
        [#imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "30"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "20"), #imageLiteral(resourceName: "37"), #imageLiteral(resourceName: "21"), #imageLiteral(resourceName: "28"), #imageLiteral(resourceName: "10"), #imageLiteral(resourceName: "24"), #imageLiteral(resourceName: "27"), #imageLiteral(resourceName: "16"), #imageLiteral(resourceName: "26"), #imageLiteral(resourceName: "33"), #imageLiteral(resourceName: "35") ],
        [#imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "30"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "20"), #imageLiteral(resourceName: "37"), #imageLiteral(resourceName: "21"), #imageLiteral(resourceName: "28"), #imageLiteral(resourceName: "10"), #imageLiteral(resourceName: "24"), #imageLiteral(resourceName: "27"), #imageLiteral(resourceName: "16"), #imageLiteral(resourceName: "26"), #imageLiteral(resourceName: "33"), #imageLiteral(resourceName: "35") ],
        [#imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "30"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "20"), #imageLiteral(resourceName: "37"), #imageLiteral(resourceName: "21"), #imageLiteral(resourceName: "28"), #imageLiteral(resourceName: "10"), #imageLiteral(resourceName: "24"), #imageLiteral(resourceName: "27"), #imageLiteral(resourceName: "16"), #imageLiteral(resourceName: "26"), #imageLiteral(resourceName: "33"), #imageLiteral(resourceName: "35") ],
        [#imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "30"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "20"), #imageLiteral(resourceName: "37"), #imageLiteral(resourceName: "21"), #imageLiteral(resourceName: "28"), #imageLiteral(resourceName: "10"), #imageLiteral(resourceName: "24"), #imageLiteral(resourceName: "27"), #imageLiteral(resourceName: "16"), #imageLiteral(resourceName: "26"), #imageLiteral(resourceName: "33"), #imageLiteral(resourceName: "35") ]]

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }

    func setupNavBar() {
        let label = UILabel()
        label.text = "Готовим"
        label.textColor = #colorLiteral(red: 0.2784313725, green: 0.2941176471, blue: 0.3607843137, alpha: 1)
        label.font = UIFont(name: "OpenSans-Bold", size: 34)
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        self.tabBarController?.navigationItem.hidesBackButton = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "EmbeddedTableViewCell", bundle: nil), forCellReuseIdentifier: "EmbeddedTableViewCell")
        tableView.register(UINib(nibName: "PlainTableViewCell", bundle: nil), forCellReuseIdentifier: "PlainTableViewCell")

    }
}

// MARK: - Collection View DataSourse & Delegate
extension MainRecipesVC: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewCellData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewID", for: indexPath) as! RecipesCollectionViewCell
        
        cell.recipesCollectionViewCell.image = collectionViewCellData[indexPath.section][indexPath.row]
        return cell

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 200)
    }


}

// Mark: - TableView Datasourse & Delegate

extension MainRecipesVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? EmbeddedTableViewCell else { return }
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
//       tableViewCell.collectionView.reloadData()
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) 
        let label = UILabel()
        label.text = sectionTitles[section]
        label.font = UIFont(name: "OpenSans-Regular", size: 17)
        label.textColor = #colorLiteral(red: 0.2784313725, green: 0.2941176471, blue: 0.3607843137, alpha: 1)
        label.frame = CGRect(x: 16, y: 30, width: 250, height: 22)
        view.addSubview(label)
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let indexPathForCellType = indexPath.section

        switch indexPathForCellType {
        case 0, 4...7:
            let cellEmbedded = tableView.dequeueReusableCell(withIdentifier: "EmbeddedTableViewCell", for: indexPath) as! EmbeddedTableViewCell
            return cellEmbedded

        case 1...3:
            let cellPlain = tableView.dequeueReusableCell(withIdentifier: "PlainTableViewCell", for: indexPath) as! PlainTableViewCell
            cellPlain.plainTableViewImg.image = plainTableViewCellData[indexPath.section - 1][indexPath.row]
            return cellPlain
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}

