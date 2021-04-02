//
//  WheatherTableViewCell.swift
//  HW14
//
//  Created by mac on 31.03.2021.
//

import UIKit

class WheatherTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var dataLabel: UILabel!
    
    
    @IBOutlet weak var dailyTempLabel: UILabel!
    
    @IBOutlet weak var dailyFeelsLikeLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
