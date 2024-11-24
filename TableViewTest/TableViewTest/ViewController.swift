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
    var array: [[String:Any]] = []
    
    
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
    
    func createDictinary() -> [[String: Any]] {
        var dict: [String: Any] = [:]
        
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMM"
        let dateString = formatter.string(from: now)
        
        for i in 10..<30 {
            dict["date"] = "\(dateString)\(i)"
            dict["score"] = i
            self.array.append(dict)
        }
        return self.array
    }
    
    func getDateListwithScore(list: [[String:Any]]) -> [String:Int] {
        
        let dates = list.compactMap { $0["date"] }
        let scores = list.compactMap { $0["score"] }
        var result: [String:Int] = [:]
        
        for i in 0..<dates.count {
            let date = dates[i] as! String
            let score = scores[i] as! Int
            result.updateValue(score, forKey: date)
        }
        
        return result
    }

}

struct ArrayCombiner {
    // Function to combine two arrays into dictionary
    func combineToDictionary(keys: [String], values: [Int], sortBy: SortOption = .none) -> [String: Int] {
        // Validate arrays have same length
        guard keys.count == values.count else {
            print("Error: Arrays must have the same length")
            return [:]
        }
        
        // Create dictionary using zip
        var dictionary = Dictionary(uniqueKeysWithValues: zip(keys, values))
        
        switch sortBy {
        case .byKey:
            // Convert to array of tuples, sort, and convert back to dictionary
            dictionary = Dictionary(uniqueKeysWithValues: dictionary.sorted { $0.key < $1.key })
        case .byValue:
            dictionary = Dictionary(uniqueKeysWithValues: dictionary.sorted { $0.value < $1.value })
        case .byKeyDescending:
            dictionary = Dictionary(uniqueKeysWithValues: dictionary.sorted { $0.key > $1.key })
        case .byValueDescending:
            dictionary = Dictionary(uniqueKeysWithValues: dictionary.sorted { $0.value > $1.value })
        case .none:
            break
        }
        
        return dictionary
    }
    
    // Enum for sorting options
      enum SortOption {
          case none
          case byKey
          case byValue
          case byKeyDescending
          case byValueDescending
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
                let dic = self.createDictinary()
                print(dic)
            }
            
            cell.yellowButtonTapAction = {
                let list = self.createDictinary()
                let dates = list.compactMap { $0["date"] }
                let scores = list.compactMap { $0["score"] }
                let result = ArrayCombiner().combineToDictionary(keys: dates as! [String], values: scores as! [Int], sortBy: .byValue)
                print(result)
            }
            cell.selectionStyle = .none
            return cell
        case TestCell.identifier:
            let cell = tableView.dequeueReusableCell(withIdentifier: TestCell.identifier, for: indexPath) as! TestCell
            
            cell.buttonTapAction = {
                let dic = self.createDictinary()
                let result = self.getDateListwithScore(list: dic)
                print(result)
            }
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
