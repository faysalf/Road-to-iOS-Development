//
//  ViewController.swift
//  CustomTableView
//
//  Created by Md. Faysal Ahmed on 15/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    var imges = ["selim","sajed","AAM","maruf","halal","mobarok","chinmoy","tarif","yasin","murad","kashem","monir","prithom","faysalf"]
    
    var nmes = ["Engr Muhammad Selim","Engr. Sajedul Islam", "Al-Amin Mridha","Marufur Rahman","Halal Uddin","Hosne Mobarok","Chinmoy Biswas","Tarif Khan","Muhammad Yasin","Murad Hossain","Abul Kashem","Monir Hossain","Prithom Das","Faysal Ahmed"]
    
    var images = [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]]
    var names = [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]]
    var head = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        imgGrouping()
        
        /// setup add button ui
        addButton.layer.cornerRadius = addButton.frame.size.width/2
        addButton.backgroundColor = .black
        addButton.tintColor = .white
    }
    
    func imgGrouping() {
        for i in 0...nmes.count-1 {
            
            let ch: Character = (nmes[i].first) ?? "A"
            let s = String(ch).unicodeScalars           //convert to Unicode
            var ind = Int(s[s.startIndex].value) - 65   //index
            
            if (ind+65 > 93) {                          //For lower case letter
                ind -= 32
            }
            names[ind].append(nmes[i])
            images[ind].append(imges[i])
        }
    }
    
    func tableViewSetup() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear
        
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.6,
                       animations: {
            self.addButton.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        },
                       completion: { _ in
            UIView.animate(withDuration: 0.6) {
                self.addButton.transform = CGAffineTransform.identity
            }
        })
    }
    
}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        //set corner radius here with below 3lines
        cell.borderView.layer.cornerRadius = 10
        cell.borderView.layer.borderColor = UIColor.black.cgColor
        cell.borderView.layer.borderWidth = 0.1
        cell.selectionStyle = .none
        
        cell.img.image = UIImage(named : images[indexPath.section][indexPath.row] as! String)
        cell.lbl.text = (names[indexPath.section][indexPath.row] as! String)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if (names[section].count == 0) {
            return ""
        }
        return head[section]
    }
    
    //Table view Data pass
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("selected index: ", indexPath.row)
        
        let storyboardName = UIStoryboard(name: "DetailsView", bundle: nil)
        let vc = storyboardName.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        vc.modalPresentationStyle = .fullScreen
        vc.imageName = UIImage(named: images[indexPath.section][indexPath.row] as! String)
        vc.name = (names[indexPath.section][indexPath.row] as! String)
        
        self.present(vc, animated: true)
    }
    /// remove table view cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
//            self.images.remove(at: [indexPath.section][indexPath.row])
//            self.names.remove(at: [indexPath.section][indexPath.row])
            self.images[indexPath.section][indexPath.row] = ""
            self.names[indexPath.section][indexPath.row] = ""
            
            //self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.reloadData()
        }
    }
}
