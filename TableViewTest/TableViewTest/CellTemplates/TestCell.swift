//
//  TestCell.swift
//  TableViewTest
//
//  Created by Mehmet Eker on 2024/11/13.
//

import UIKit

class TestCell: UITableViewCell {
    
    @IBOutlet weak var button: UIButton!
    
    static let identifier = "TestCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TestCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonTap(_ sender: Any) {
        print("Button is clicked")
    }
    
}
