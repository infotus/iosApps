//
//  DemoCell.swift
//  TableViewTest
//
//  Created by Mehmet Eker on 2024/11/13.
//

import UIKit

class DemoCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    static let identifier = "DemoCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "DemoCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
