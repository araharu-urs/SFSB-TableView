//
//  TableViewHeaderFooterVC.swift
//  SFSB-TableView
//
//  Created by Uriel Rodriguez Sandoval on 04/05/24.
//

import UIKit

class TableViewHeaderFooterVC: UIViewController {

    let data = [
        ["value 1", "value 2", "value 3", "value 4", "value 5",  "value 5",  "value 5"]
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
        header.backgroundColor = .orange
        
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        footer.backgroundColor = .magenta
        
        tableView.tableHeaderView = header
        tableView.tableFooterView = footer
    }
}

extension TableViewHeaderFooterVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
}

extension TableViewHeaderFooterVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .lightGray
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        
        return cell
    }
}
