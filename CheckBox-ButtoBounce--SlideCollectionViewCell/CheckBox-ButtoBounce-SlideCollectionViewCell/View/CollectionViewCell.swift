//
//  CollectionViewCell.swift
//  Slide-Collection-View
//
//  Created by Md. Faysal Ahmed on 25/10/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var vip: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.vip.layer.cornerRadius = 50;
    }

}
