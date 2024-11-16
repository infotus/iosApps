//
//  ViewController.swift
//  TableViewTest
//
//  Created by Mehmet Eker on 2024/11/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var toggleButton: UIButton!
    
    var tableName = ""
    var list = [TestCell.identifier, DemoCell.identifier, FieldCell.identifier, StackCell.identifier]
    var index = 0
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableName = list[index]
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(StackCell.nib(), forCellReuseIdentifier: StackCell.identifier)
        tableView.register(TestCell.nib(), forCellReuseIdentifier: TestCell.identifier)
        tableView.register(DemoCell.nib(), forCellReuseIdentifier: DemoCell.identifier)
        tableView.register(FieldCell.nib(), forCellReuseIdentifier: FieldCell.identifier)
        
        toggleButton.addTarget(self, action: #selector(toggleCellType), for: .touchUpInside)

    }
    
    @objc func toggleCellType() {
        // Change the value of the displayString to switch between label and button
        if index < 3 {
            index += 1
            tableName = list[index]
        } else {
            index = 0
            tableName = list[index]
        }
        
        // Reload the table view to update the displayed cell
        DispatchQueue.main.async {
            self.tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .none)
//            self.tableView.reloadData()
        }
        
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = UITableViewCell()
        switch tableName {
        case StackCell.identifier:
            let cell = tableView.dequeueReusableCell(withIdentifier: StackCell.identifier, for: indexPath) as! StackCell
            cell.redButtonTapAction = {
                print("RED BUTTON CLICK ACTION")
            }
            cell.selectionStyle = .none
            return cell
        case TestCell.identifier:
            let cell = tableView.dequeueReusableCell(withIdentifier: TestCell.identifier, for: indexPath) as! TestCell
            cell.selectionStyle = .none
            return cell
        case DemoCell.identifier:
            let cell = tableView.dequeueReusableCell(withIdentifier: DemoCell.identifier, for: indexPath) as! DemoCell
            cell.selectionStyle = .none
            return cell
        case FieldCell.identifier:
            let cell = tableView.dequeueReusableCell(withIdentifier: FieldCell.identifier, for: indexPath) as! FieldCell
            cell.selectionStyle = .none
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: TestCell.identifier, for: indexPath) as! TestCell
            cell.selectionStyle = .none
            return cell
        }
//        cell.contentView.frame = tableView.frame
//        cell.selectionStyle = .none
//        return cell
    }

}

extension UIViewController{


    func shotAlert(title:String, description:String){
        // Create Alert Controller
        let alertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
        
        // Add an action to the alert
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        // Present the alert
        present(alertController, animated: true)
    }

}
