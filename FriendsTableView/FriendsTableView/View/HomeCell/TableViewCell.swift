//
//  TableViewCell.swift
//  FriendsTableView
//
//  Created by Md. Faysal Ahmed on 26/5/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(img: UIImage?, name: String){
        imgView.image = img
        labelView?.text = name
    }

}
