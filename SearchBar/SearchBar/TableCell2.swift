//
//  TableCell2.swift
//  SearchBar
//
//  Created by 송동욱 on 2018. 9. 8..
//  Copyright © 2018년 송. All rights reserved.
//

import UIKit

class TableCell2: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
