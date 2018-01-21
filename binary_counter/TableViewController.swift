//
//  TableViewController.swift
//  binary_counter
//
//  Created by Rachel Ng on 1/20/18.
//  Copyright © 2018 Rachel Ng. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, CustomViewCellDelegate {

    
    var dataArr: [Int] = []
    
    var calculationTotal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let power = 16
        var total = 1

        for _ in 1...power {
            total = total * 10
            dataArr.append(total)
        }
    }
    
    func AddTotal(binary: Int) {
        calculationTotal += binary
        tableView.reloadData()
    }
    
    func MinusTotal(binary: Int) {
        calculationTotal -= binary
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return dataArr.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var priceCell: PriceTableViewCell?
        var cell: CustomViewCell?
        
        if indexPath.section == 0 {
            priceCell = tableView.dequeueReusableCell(withIdentifier: "PriceCell") as? PriceTableViewCell
            priceCell?.textLabel?.text = String(describing: calculationTotal)
            return priceCell!
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomViewCell
            cell?.label.text = String(dataArr[indexPath.row])
            cell?.delegate = self
            cell?.binary = dataArr[indexPath.row]
            return cell!
        }
    }

}
