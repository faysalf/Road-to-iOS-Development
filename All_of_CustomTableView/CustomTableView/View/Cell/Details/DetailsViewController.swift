//
//  DetailsView.swift
//  CustomTableView
//
//  Created by Md. Faysal Ahmed on 16/9/22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imgDt: UIImageView!
    @IBOutlet weak var lblDt: UILabel!
    
    var imageName: UIImage?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        guard let imageName = imageName else { return }
//        guard let name = name else { return }
        if let imgg = imageName, let nam = name {
            imgDt.image = imageName
            lblDt.text = name
        }
    }

    // MARK: - Button Action.

    @IBAction func backButtonAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    
}
