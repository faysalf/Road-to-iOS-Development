//
//  ViewController.swift
//  SimpleCollectionView
//
//  Created by Md. Faysal Ahmed on 03/08/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var flagName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        flagImage.layer.cornerRadius = 0.5 * flagImage.frame.height
        flagName.layer.cornerRadius = 0.5 * flagName.frame.height
        
    }
    
    public func configure(image: UIImage, text: String){
        flagImage.image = image
        flagName.text = text
    }
}
