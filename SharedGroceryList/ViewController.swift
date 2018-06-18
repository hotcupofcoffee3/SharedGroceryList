//
//  ViewController.swift
//  SharedGroceryList
//
//  Created by Adam Moore on 6/18/18.
//  Copyright © 2018 Adam Moore. All rights reserved.
//

import UIKit
import CoreData
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func add(newItem: String) {
        
        groceryList.append(newItem)
        
    }
    
    @IBAction func addGroceryItem(_ sender: UIButton) {
        
        if addItemTextField.text != "" {
            
            add(newItem: addItemTextField.text!)
            
            addItemTextField.text = ""
            
            tableOfItems.reloadData()
            
        }
        
    }
    
    @IBOutlet weak var tableOfItems: UITableView!
    
    @IBOutlet weak var addItemTextField: UITextField!
    
    var groceryList = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = groceryList[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            groceryList.remove(at: indexPath.row)
            
            tableView.reloadData()
            
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

