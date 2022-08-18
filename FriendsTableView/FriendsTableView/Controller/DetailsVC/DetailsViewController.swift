//
//  DetailsViewController.swift
//  FriendsTableView
//
//  Created by Md. Faysal Ahmed on 29/7/22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var imageName =  ""
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: imageName)
        nameLabel.text = name
    }

    // MARK: - Button Action.
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

}
