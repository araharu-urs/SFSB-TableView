//
//  TableViewSectionsVC.swift
//  SFSB-TableView
//
//  Created by Uriel Rodriguez Sandoval on 04/05/24.
//

import UIKit

class TableViewSectionsVC: UIViewController {

    let data = [
        ["value 1", "value 2", "value 3", "value 4", "value 5", "value 6"],
        ["arreglo2 val 1", "arreglo2 val 2", "arreglo2 val 3",],
        ["arreglo3 - val 1", "arreglo3 - val 2", "arreglo3 - val 3",]
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension TableViewSectionsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
}

extension TableViewSectionsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
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

