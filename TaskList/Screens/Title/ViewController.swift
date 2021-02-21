//
//  ViewController.swift
//  TaskList
//
//  Created by Shpilko Ilya on 2/19/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func HomeTableView(_ sender: UIButton) {
        if let homeTableViewController = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(identifier: "HomeTable") as? HomeTableViewController {
            navigationController?.pushViewController(homeTableViewController, animated: true)
        }
    }
    @IBAction func lessonWorkButton(_ sender: UIButton) {
        if sender.tag == 0 {
            guard let vc = UIStoryboard(name: "LessonStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? TableViewController else { return }
            present(vc, animated: true)
        } else {
            guard let vc = UIStoryboard(name: "LessonStoryboard", bundle: nil).instantiateViewController(withIdentifier: "CollectionViewController") as? CollectionViewController else { return }
            present(vc, animated: true)
        }
    }
    

}

