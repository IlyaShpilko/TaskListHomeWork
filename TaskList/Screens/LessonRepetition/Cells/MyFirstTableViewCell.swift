//
//  MyFirstTableViewCell.swift
//  TaskList
//
//  Created by Shpilko Ilya on 2/12/21.
//

import UIKit

class MyFirstTableViewCell: UITableViewCell {
    
    @IBOutlet weak var topLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
