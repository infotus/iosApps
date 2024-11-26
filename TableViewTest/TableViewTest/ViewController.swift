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
    let refreshControl = UIRefreshControl()
    
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
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)

    }
    @objc func refresh(sender:AnyObject)
    {
        // Updating your data here...

        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
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

    func containsWord(text: String, word: String) -> Bool {
        return text.lowercased().contains(word.lowercased())
    }
    
    // Method 4: Whole word check (with word boundaries)
    func containsWholeWord(text: String, word: String) -> Bool {
        let pattern = "\\b\(word)\\b"
        return text.range(of: pattern, options: .regularExpression) != nil
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
                let dates = list.compactMap { ($0["date"] as! String)}
                let scores = list.compactMap { ($0["score"] as! Int)}
                let result = Dictionary.init(keys: dates, values: scores)
                
                let sortedDict = result.sorted { $0.key < $1.key }
                print(sortedDict)
                
                // Sum value ogf int array
                let sortedDictArray = Array(sortedDict.map({ $0.value }))
                print(sortedDictArray.reduce(0, +))
               
            }
            cell.selectionStyle = .none
            return cell
        case TestCell.identifier:
            let cell = tableView.dequeueReusableCell(withIdentifier: TestCell.identifier, for: indexPath) as! TestCell
            
            cell.buttonTapAction = {
                let dic = self.createDictinary()
                let result = self.getDateListwithScore(list: dic)
                print(result)
                
                let text = "2024summer_word_weight"
                let word = "WEight"
                print(self.containsWord(text: text, word: word))
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

extension Dictionary {
    init(keys: [Key], values: [Value]) {
        self.init()

        for (key, value) in zip(keys, values) {
            self[key] = value
        }
    }
}
