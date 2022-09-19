//
//  ViewController.swift
//  LiveWallpaperr
//
//  Created by Md. Faysal Ahmed on 19/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customTableView : UITableView!
    
    let head = ["New", "Popular", "Featured", "Pro"]
    
    let item = [
        ["one"],
        ["one"],
        ["One"],
        ["One"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpTable()
    }
    
    func setUpTable() {
        let nib = UINib(nibName: "customTableViewCell", bundle: nil)
        customTableView.register(nib, forCellReuseIdentifier: "cell")
        
        customTableView.delegate = self
        customTableView.dataSource = self
    }
    //MARK: - ACTION
    @objc func nextBtnAction(){
        let storyboard = UIStoryboard(name: "Details", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = Bundle.main.loadNibNamed("headerSectionCell", owner: self, options: nil)?.first as! headerSectionCell
        
        /// header cell action
        if (section == 0) {
            headerCell.nextButton.addTarget(self, action: #selector(nextBtnAction), for: .touchUpInside)
        }else if (section == 1) {
            headerCell.nextButton.addTarget(self, action: #selector(nextBtnAction), for: .touchUpInside)
        }
        else if (section == 2) {
            headerCell.nextButton.addTarget(self, action: #selector(nextBtnAction), for: .touchUpInside)
        }
        else {
            headerCell.nextButton.addTarget(self, action: #selector(nextBtnAction), for: .touchUpInside)
        }
        headerCell.configure(text: head[section])
        return headerCell
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        head[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return head.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celll = customTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customTableViewCell
        
        celll.lbl.text = item[indexPath.section][indexPath.row]
        
        return celll
    }
    
    
}
