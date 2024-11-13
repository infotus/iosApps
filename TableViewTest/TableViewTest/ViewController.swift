//
//  ViewController.swift
//  TableViewTest
//
//  Created by Mehmet Eker on 2024/11/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tableName = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableName = "FieldCell"
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = tableView.contentSize.height
        tableView.register(TestTableViewCell.nib(), forCellReuseIdentifier: TestTableViewCell.identifier)
        tableView.register(TestCell.nib(), forCellReuseIdentifier: TestCell.identifier)
        tableView.register(DemoCell.nib(), forCellReuseIdentifier: DemoCell.identifier)
        tableView.register(FieldCell.nib(), forCellReuseIdentifier: FieldCell.identifier)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        centerCell(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch tableName {
        case TestTableViewCell.identifier:
            cell = tableView.dequeueReusableCell(withIdentifier: TestTableViewCell.identifier, for: indexPath) as! TestTableViewCell
        case TestCell.identifier:
            cell = tableView.dequeueReusableCell(withIdentifier: TestCell.identifier, for: indexPath) as! TestCell
        case DemoCell.identifier:
            cell = tableView.dequeueReusableCell(withIdentifier: DemoCell.identifier, for: indexPath) as! DemoCell
        case FieldCell.identifier:
            cell = tableView.dequeueReusableCell(withIdentifier: FieldCell.identifier, for: indexPath) as! FieldCell
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: TestTableViewCell.identifier, for: indexPath) as! TestTableViewCell
        }
        cell.contentView.frame = tableView.frame
        cell.selectionStyle = .none
        return cell
    }
    
    // This is where you center a specific cell
      func centerCell(at indexPath: IndexPath) {
          // Get the table view's bounds and the selected cell's frame
          let cellFrame = tableView.rectForRow(at: indexPath)
          let tableViewHeight = tableView.bounds.height
          
          // Calculate the content offset needed to center the cell
          let offsetY = cellFrame.origin.y - (tableViewHeight - cellFrame.height) / 2
          
          // Adjust the content offset to center the cell
          let contentOffset = CGPoint(x: 0, y: offsetY)
          tableView.setContentOffset(contentOffset, animated: true)
      }
      

}
