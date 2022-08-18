//
//  ViewController.swift
//  TodoList
//
//  Created by Md. Faysal Ahmed on 1/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViwe()
    }

    // MARK: - Private Methods.
    func setupTableViwe(){
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        todoTableView.register(nib, forCellReuseIdentifier: "cell")
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
    }
    
    // MARK: - Button Action.
    @IBAction func addButtonAction(_ sender: UIBarButtonItem) {
        print("Add Button Action")
    }    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        return cell
    }
    
    
}

