//
//  ViewController.swift
//  CustomTableViewe
//
//  Created by Md. Faysal Ahmed on 30/7/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customTableView: UITableView!        //custom table view declaration
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    // MARK: - Private Methods.
    func setupTableView() {
        
        let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        customTableView.register(nib, forCellReuseIdentifier: "cell")   //then register korte hobe
        
        let nib2 = UINib(nibName: "FrameTwoTableViewCell", bundle: nil)
        customTableView.register(nib2, forCellReuseIdentifier: "cell1")
        
        customTableView.delegate = self
        customTableView.dataSource = self
    }
    
    // MARK: - Button Action.

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var retcell = UITableViewCell();
        if (indexPath.row % 2 == 0) {
            let cell = customTableView.dequeueReusableCell(withIdentifier: "cell") as! HomeTableViewCell
            retcell = cell
        }
        else {
            let cell = customTableView.dequeueReusableCell(withIdentifier: "cell1") as! FrameTwoTableViewCell
            retcell = cell
        }
        return retcell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return "Section A"
        }
        else if (section == 1) {
            return "Section B"
        }
        else {
            return "Section C"
        }
    }
}
