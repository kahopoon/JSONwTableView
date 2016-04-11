//
//  TableViewCell.swift
//  JSONwTableView
//
//  Created by Ka Ho on 11/4/2016.
//  Copyright © 2016 Ka Ho. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var imageShow: UIImageView!
    @IBOutlet weak var titleShow: UILabel!
    @IBOutlet weak var descriptionShow: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
