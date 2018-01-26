//
//  TableViewCell.swift
//  IosExam
//
//  Created by Beaconyx on 2018. 1. 25..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var textView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
