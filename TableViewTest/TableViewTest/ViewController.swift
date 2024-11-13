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
        tableName = "TestCell"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(TestTableViewCell.nib(), forCellReuseIdentifier: TestTableViewCell.identifier)
        self.tableView.register(TestCell.nib(), forCellReuseIdentifier: TestCell.identifier)
        self.tableView.register(DemoCell.nib(), forCellReuseIdentifier: DemoCell.identifier)
        self.tableView.register(FieldCell.nib(), forCellReuseIdentifier: FieldCell.identifier)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Select \(indexPath.row)")
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
        cell.contentView.frame = tableView.bounds
        cell.selectionStyle = .none
        return cell
    }
    

}
