//
//  ViewController.swift
//  TaskListHomeWork
//
//  Created by Shpilko Ilya on 2/16/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func pushNextViewController(_ sender: UIButton) {
        if let storyboard = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(identifier: "HomeWorkTableViewTableViewController") as? HomeWorkTableViewTableViewController {
            navigationController?.pushViewController(storyboard, animated: true)
        }
    }
    

}

