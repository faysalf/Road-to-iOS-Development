//
//  ViewController.swift
//  CustomTableViewGroup
//
//  Created by Md. Faysal Ahmed on 31/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customGropuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpTableView()
    }
    
    func setUpTableView() {
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        customGropuTableView.register(nib, forCellReuseIdentifier: "cell")
        
        customGropuTableView.delegate = self
        customGropuTableView.dataSource = self
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = customGropuTableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "About"
        }
        else if section == 1 {
            return "Support"
        }
        return "Contact"
    }
}
