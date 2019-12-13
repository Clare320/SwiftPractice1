//
//  WeatherCollectionViewCell.swift
//  001
//
//  Created by Kede on 2019/12/13.
//  Copyright © 2019 Clare. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {

    let dayCellIndefiner = "dayCell"
    let infoCellIndefiner = "infoCell"
    let featureCellIndefiner = "featureCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        tableView.contentInset = UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = UIColor.clear
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: dayCellIndefiner)
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "header")
        
    }

}

extension WeatherCollectionViewCell: UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: dayCellIndefiner, for: indexPath)
        cell.textLabel?.text = "\(indexPath.item)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        view.backgroundColor = .cyan
        header?.addSubview(view)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
}
