//
//  ViewController.swift
//  FriendsTableView
//
//  Created by Md. Faysal Ahmed on 26/5/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var name = ["Al-Amin Mridha", "Engr Md Selim", "Halal Uddin", "Hosne Mobarok", "Chinmoy Bishwas","Tarif Khan", "Murad Hossain", "Abul Kashem", "Mohammad Yasin", "Monir Hossain","Faysal Ahmed", "Prithom Alex"]
    
    var img = ["AAM","selim", "halal","mobarok","chinmoy","tarif", "murad","kashem","yasin","monir","faysalf","prithom"]
    
//    var nameData: [String]!
//    var imagData: [String]!
//
//    var isSearching = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    // MARK: - Private Method.
    func setupTableView() {
        tableView.delegate = self       //egulute error dekhale class e UITableViewDelegate, UITableViewData.. declr krte hobe
        tableView.dataSource = self
        // tableView.separatorColor = .clear
        //searchBar.delegate = self

    }
    
    // MARK: - Button Action.


}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if isSearching {
//            return nameData.count
//        }else{
//            return name.count
//        }
        return name.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath) as! TableViewCell   //"cell" holo identifier
        
//        if isSearching {
//            cell.configure(img: UIImage(named: img[indexPath.row]), name: name[indexPath.row])
//            cell.selectionStyle = .none
//            return cell
//        }
//        else {
        cell.configure(img: UIImage(named: img[indexPath.row]), name: name[indexPath.row])
            cell.selectionStyle = .none
            return cell

    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    //Table view Data pass
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected index: ", indexPath.row)
        
        let storyboardName = UIStoryboard(name: "Details", bundle: nil)
        let vc = storyboardName.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        vc.modalPresentationStyle = .fullScreen
        
        vc.imageName = img[indexPath.row]
        vc.name = name[indexPath.row]
        
        self.present(vc, animated: true)  // animate kore details page e niye jabe
        //vc.modalTransitionStyle = .partialCurl // present transitions styl
    }
    
    /// remove table view cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
            self.img.remove(at: indexPath.row)
            self.name.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

}

//
//extension ViewController: UISearchBarDelegate {
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        nameData = name.filter { term in
//            return term.lowercased().contains(searchText.lowercased())
//        }
//
//        imagData = img.filter({
//            imge in
//            return imge.lowercased().contains(searchText.lowercased())
//        })
//
//        isSearching = true
//        tableView.reloadData()
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        isSearching = false
//        searchBar.text = ""
//        tableView.reloadData()
//    }
//}
