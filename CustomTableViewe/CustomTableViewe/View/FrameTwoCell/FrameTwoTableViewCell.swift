//
//  FrameTwoTableViewCell.swift
//  CustomTableViewe
//
//  Created by Md. Faysal Ahmed on 30/7/22.
//

import UIKit

class FrameTwoTableViewCell: UITableViewCell {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var nameLabel1: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        firstImageView.layer.cornerRadius = firstImageView.frame.height / 2;
        secondImageView.layer.cornerRadius = secondImageView.frame.height / 2;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
