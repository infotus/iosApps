//
//  TestTableViewCell.swift
//  TableViewTest
//
//  Created by Mehmet Eker on 2024/11/12.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var cancel: UIButton!
    
    @IBOutlet weak var submit: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
