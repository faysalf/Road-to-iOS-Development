//
//  ViewController.swift
//  InshotFaysal
//
//  Created by Md. Faysal Ahmed on 28/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view2Width: NSLayoutConstraint!
    @IBOutlet weak var view2Height: NSLayoutConstraint!
    @IBOutlet weak var bottomConst: NSLayoutConstraint!
    
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var testStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cornerRadius()
    }
    
    override func viewDidLayoutSubviews() {
        if (view.frame.width <= 380) {
            view2Width.constant = 334;
            view2Height.constant = 175
        }
    }
    
    func cornerRadius() {
        view2.layer.cornerRadius = 15
        img1.layer.cornerRadius = 10
        img2.layer.cornerRadius = 10
        img3.layer.cornerRadius = 10

    }


}

