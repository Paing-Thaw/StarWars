//
//  FilmsTableViewCell.swift
//  TVShow
//
//  Created by Eureka Tatsu on 1/26/22.
//

import UIKit

class FilmsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var dateLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
