//
//  FieldCell.swift
//  TableViewTest
//
//  Created by Mehmet Eker on 2024/11/14.
//

import UIKit

class FieldCell: UITableViewCell, UITextFieldDelegate{
    
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var stackView: UIStackView!
    
    var labels: [UILabel] = []
    
    static let identifier = "FieldCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "FieldCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        field.delegate = self
        // Initialization code
        setupLabels()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("\(textField.text ?? "")")
        return true
    }
    
    func updateLabelColors(basedOn percentage: Double) {
         let numberOfRedLabels = Int((percentage / 100.0) * Double(labels.count))
         
         for (index, label) in labels.enumerated() {
             if index < numberOfRedLabels {
                 label.backgroundColor = .red
             } else {
                 label.backgroundColor = .gray
             }
         }
     }
    
    func setupLabels() {
        for i in 0..<10 {
            let label = UILabel()
            label.backgroundColor = .gray
            label.textAlignment = .center
            label.text = "\(i + 1)"
            labels.append(label)
            stackView.addArrangedSubview(label)
        }
    }
}
