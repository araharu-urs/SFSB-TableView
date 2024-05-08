//
//  TableWithCollectionVC.swift
//  SFSB-TableView
//
//  Created by Uriel Rodriguez Sandoval on 04/05/24.
//

import UIKit

enum TypeOfCell {
    case none
    case checkBox
    case ratiobutton
}

class TableWithCollectionVC: UIViewController {

    let data = ["", ""]
    let types: [TypeOfCell] = [.checkBox, .ratiobutton]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: "TableCell")
        tableView.register(UINib(nibName: "TextCell", bundle: nil), forCellReuseIdentifier: "TextCell")
    }
    
    func typeOfCell(_ cell: TypeOfCell, index: IndexPath) -> UITableViewCell {
        
        switch cell {
            case .checkBox:
                return checkBoxCell(index: index)
            case .ratiobutton:
                return ratioButtonCell(index: index)
            case .none:
                return UITableViewCell()
        }
        
        
    }
    
    func checkBoxCell(index: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: index) as? TableCell ?? TableCell()
            cell.backgroundColor = .lightGray
        return cell
    }
    
    func ratioButtonCell(index: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: index) as? TextCell ?? TextCell()
                   cell.titleLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        
        return cell
    }
}

extension TableWithCollectionVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TableWithCollectionVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.item == 0 ? 100 : UITableView.automaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return typeOfCell(types[indexPath.row], index: indexPath)
    }
}
