//
//  HomeTableViewCell.swift
//  CustomTableViewe
//
//  Created by Md. Faysal Ahmed on 30/7/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImage.layer.cornerRadius = 0.5 * profileImage.frame.height
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
