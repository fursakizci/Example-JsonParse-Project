//
//  CustomHeaderCell.swift
//  JsonParse
//
//  Created by Furkan sakızcı on 26.07.2019.
//  Copyright © 2019 Furkan sakızcı. All rights reserved.
//

import UIKit

class CustomHeaderCell: UITableViewCell {

   
    @IBOutlet weak var titleLabel2: UILabel!
    
    @IBOutlet weak var subtitleLabel2: UILabel!
    
    
    @IBOutlet weak var headerLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
