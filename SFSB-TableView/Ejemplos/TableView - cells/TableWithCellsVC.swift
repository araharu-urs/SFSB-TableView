//
//  TableWithCellsVC.swift
//  SFSB-TableView
//
//  Created by Uriel Rodriguez Sandoval on 04/05/24.
//

import UIKit

class TableWithCellsVC: UIViewController {

    let data = ["value 1", "value 2", "value 3", "value 4", "value 5", "value 6"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension TableWithCellsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
}

extension TableWithCellsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .lightGray
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }
}
