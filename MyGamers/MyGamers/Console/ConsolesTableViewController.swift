//
//  ConsolesTableViewController.swift
//  MyGamers
//
//  Created by Marcus on 25/08/20.
//  Copyright © 2020 cesar. All rights reserved.
//

import UIKit
import CoreData

class ConsolesTableViewController: UITableViewController {
    
    var consolesManager = ConsolesManager.shared
    
    var fetchedResultController: NSFetchedResultsController<Console>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        consolesManager.loadConsoles(with: context)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        consolesManager.loadConsoles(with: context)
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return consolesManager.consoles.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ConsoleTableViewCell
        let console = consolesManager.consoles[indexPath.row]
        cell.configConsoleCell(console)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            consolesManager.deleteConsole(index: indexPath.row, context: context)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
        
    /*
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier! == "consoleSegue" {
             print("consoleSegue")
             let vc = segue.destination as! ConsoleViewController
             
             if let consoles = fetchedResultController.fetchedObjects {
                 vc.console = consoles[tableView.indexPathForSelectedRow!.row]
             }
             
         } else if segue.identifier! == "newConsoleSegue" {
             print("newConsoleSegue")
         }
     }
     **/
    
}
