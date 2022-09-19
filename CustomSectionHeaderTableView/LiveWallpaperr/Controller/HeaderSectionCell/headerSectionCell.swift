//
//  headerSectionCell.swift
//  LiveWallpaperr
//
//  Created by Md. Faysal Ahmed on 19/9/22.
//

import UIKit

class headerSectionCell: UITableViewCell {

    @IBOutlet weak var sectionNameLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(text: String){
        sectionNameLabel.text = text
    }
    
}
