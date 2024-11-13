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
    
    static let identifier = "TestTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TestTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func yellowTap(_ sender: Any) {
    }
    
    @IBAction func redTap(_ sender: Any) {
    }
    
}

