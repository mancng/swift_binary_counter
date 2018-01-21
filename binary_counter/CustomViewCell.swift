//
//  CustomViewCell.swift
//  binary_counter
//
//  Created by Rachel Ng on 1/20/18.
//  Copyright © 2018 Rachel Ng. All rights reserved.
//

import UIKit

protocol CustomViewCellDelegate {
    func AddTotal(binary: Int)
    func MinusTotal(binary: Int)
}

class CustomViewCell: UITableViewCell {
    
    var delegate: CustomViewCellDelegate?
    var binary: Int?
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func minusBtnPressed(_ sender: UIButton) {
        delegate?.MinusTotal(binary: binary!)
    }
    
    @IBAction func plusBtnPressed(_ sender: UIButton) {
        delegate?.AddTotal(binary: binary!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
