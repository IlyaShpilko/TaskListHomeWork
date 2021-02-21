//
//  HomeTableViewCell.swift
//  TaskList
//
//  Created by Shpilko Ilya on 2/19/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var labelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
