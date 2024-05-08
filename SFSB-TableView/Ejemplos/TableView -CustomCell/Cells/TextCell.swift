//
//  TextCell.swift
//  SFSB-TableView
//
//  Created by Uriel Rodriguez Sandoval on 04/05/24.
//

import UIKit

class TextCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.textAlignment = .justified
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
