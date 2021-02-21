//
//  HomeWorkTableViewTableViewController.swift
//  TaskListHomeWork
//
//  Created by Shpilko Ilya on 2/16/21.
//

import UIKit
import CoreData

class HomeWorkTableViewTableViewController: UITableViewController, UITextFieldDelegate {
    
    var arrayTaskList = [TextForTaskList]()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    var alertAction: UIAlertAction? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Homework Task list and Memory"
        tableView.register(UINib(nibName: "HomeWorkTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeWorkTableViewCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        do {
            let result = try context?.fetch(TextForTaskList.fetchRequest())
            arrayTaskList = result as! [TextForTaskList]
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func addTextButton(_ sender: Any) {
        //Alert с button и textfield для добавления в coredata
        let alertController = UIAlertController(title: "Add new element", message: nil, preferredStyle: .alert)
        alertController.addTextField { (text) in
            text.addTarget(self, action: #selector(self.textFieldDidChangeSelection(_:)), for: .editingChanged)
        }
        alertController.addAction(add(controller: alertController))
        present(alertController, animated: true, completion: nil)
    }
    
    func add(controller: UIAlertController?) -> UIAlertAction {
        let writeText = controller?.textFields?.first
        var action = alertAction
        action = UIAlertAction(title: "Add", style: .default) { (action) in
            self.save(to: writeText?.text ?? "")
            self.tableView.reloadData()
        }
        
        return action ?? UIAlertAction()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let textCount = textField.text?.count else { return }
        if textCount > 3 {
            alertAction?.isEnabled = true
        } else {
            alertAction?.isEnabled = false
        }
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTaskList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeWorkTableViewCell") as? HomeWorkTableViewCell
        cell?.textLabel?.text = arrayTaskList[indexPath.row].value(forKey: "addedText") as? String
        return cell ?? UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            context?.delete(arrayTaskList[indexPath.row])
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
        
        do {
            arrayTaskList = try context!.fetch(TextForTaskList.fetchRequest())
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        tableView.reloadData()
    }
    
    
    //MARK: - Function save in CoreData
    func save(to text: String) {
        let person = TextForTaskList(entity: TextForTaskList.entity(), insertInto: context)
        person.setValue(text, forKey: "addedText")
        
        do {
            try context?.save()
            arrayTaskList.append(person)
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
}
