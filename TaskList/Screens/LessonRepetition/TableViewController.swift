//
//  ViewController.swift
//  TaskList
//
//  Created by Shpilko Ilya on 2/9/21.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var items: [String] = ["sss", "second", "third"]
    
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerNib(with: MyFirstTableViewCell.self)
        tableView.tableFooterView = UIView()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFirstTableViewCell") as? MyFirstTableViewCell
//        cell?.topLabel.text = items[indexPath.row]
//        return cell ?? UITableViewCell()
        
        let cell = tableView.dequeueReusableCell(with: MyFirstTableViewCell.self)
        cell.topLabel.text = items[indexPath.row]

        return cell
    }
    
    @IBAction func addElementButtonTouch(_ sender: UIButton) {
        let alertVC = UIAlertController(title: "New element", message: nil, preferredStyle: .alert)
        alertVC.addTextField { (textField) in
            
        }
        alertVC.addAction(UIAlertAction(title: "Add", style: .default, handler: { (_) in
            guard let text = alertVC.textFields?.first?.text else { return }
            self.items.append(text)
            self.tableView.reloadData()
        }))
        
        present(alertVC, animated: true, completion: nil)
    }
    
}

protocol NameDescribadle {
    var typeName: String { get }
    static var typeName: String { get }
}

extension NameDescribadle {
    var typeName: String {
        return String(describing: type(of: self))
    }
    
    static var typeName: String {
        return String(describing: self)
    }
}

extension NSObject: NameDescribadle { }

extension UITableView {
    func registerNib(with type: NameDescribadle.Type) {
        self.register(UINib(nibName: type.typeName, bundle: nil), forCellReuseIdentifier: type.typeName)
    }
    
    func dequeueReusableCell<T: NameDescribadle>(with type: T.Type) -> T{
        return self.dequeueReusableCell(withIdentifier: type.typeName) as! T
    }
}
