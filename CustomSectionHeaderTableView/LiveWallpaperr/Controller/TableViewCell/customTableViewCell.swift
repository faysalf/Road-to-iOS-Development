//
//  customTableViewCell.swift
//  LiveWallpaperr
//
//  Created by Md. Faysal Ahmed on 19/9/22.
//

import UIKit

class customTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
