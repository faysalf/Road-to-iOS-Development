//
//  TableViewCell.swift
//  TodoList
//
//  Created by Md. Faysal Ahmed on 1/8/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension TableViewCell: UITableViewDelegate, UITableViewDataSource {
    
}
