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
    
    var buttonTapAction : (() -> Void)? = nil
//    var vc : ViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonTap(_ sender: Any) {
        buttonTapAction?()
        showAlert()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        UIApplication.shared.connectedScenes.compactMap { ($0 as? UIWindowScene)?.keyWindow }.last?.rootViewController?.present(alert, animated: true, completion: nil)

     }
    
    
}
