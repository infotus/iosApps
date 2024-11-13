//
//  FieldCell.swift
//  TableViewTest
//
//  Created by Mehmet Eker on 2024/11/14.
//

import UIKit

class FieldCell: UITableViewCell, UITextFieldDelegate{
    
    @IBOutlet weak var field: UITextField!
    
    static let identifier = "FieldCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "FieldCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        field.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("\(textField.text ?? "")")
        return true
    }
}
