//
//  StackCell.swift
//  TableViewTest
//
//  Created by Mehmet Eker on 2024/11/16.
//

import UIKit


//protocol StackCellDelegate {
//  func StackViewCell(buttonTappedFor name: String)
//}

class StackCell: UITableViewCell {
    // If yo uwant edit Object in view
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var redButton: UIButton!
    
    @IBOutlet weak var yellowButton: UIButton!
   
    // Set name of cell add initializing function
    static let identifier = "StackCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "StackCell", bundle: nil)
    }

    // Object action without delegate
    var redButtonTapAction : (() -> Void)? = nil
    
    var yellowButtonTapAction : (() -> Void)? = nil
    
    var name : String?
      
    // for using delegate method to use action
//    var delegate : StackCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func yellowAction(_ sender: Any) {
        
    }
    
    @IBAction func redAction(_ sender: Any) {
        redButtonTapAction?()
    }
    
}
