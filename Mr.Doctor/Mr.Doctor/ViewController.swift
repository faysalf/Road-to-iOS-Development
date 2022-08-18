//
//  ViewController.swift
//  Mr.Doctor
//
//  Created by Md. Faysal Ahmed on 9/6/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var amountView: UILabel!
    @IBOutlet weak var regView: UILabel!
    @IBOutlet weak var appointmentV: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.frame.height / 2
        labelView.layer.masksToBounds = true
        labelView.layer.cornerRadius = labelView.frame.height / 2
        amountView.layer.masksToBounds = true
        amountView.layer.cornerRadius = amountView.frame.height / 2
        regView.layer.masksToBounds = true
        regView.layer.cornerRadius = regView.frame.height / 2
        appointmentV.layer.masksToBounds = true
        appointmentV.layer.cornerRadius = appointmentV.frame.height / 2;
        
    }


}

