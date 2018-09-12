//
//  QoutesExtension.swift
//  Qoutes
//
//  Created by Ibrahim on 11/09/2018.
//  Copyright © 2018 Ibrahim kk. All rights reserved.
//
import UIKit

extension QoutesViewController {
    // number of rows in table, total qoutes
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return writers.count
    }
    // when row is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.sRow = indexPath.row
        performSegue(withIdentifier: "toViewQoute", sender: nil)
    }
    // for editing row like deleting
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        if editingStyle == .delete {
//            let qoute = writers[indexPath.row]
//            context.delete(qoute)
//            (UIApplication.shared.delegate as! AppDelegate).saveContext()
//
//            do {
//                writers = try context.fetch(Qoutes.fetchRequest())
//            }catch{
//                print("Fetching faild after deletion")
//            }
//            tableView.reloadData()
//        }
//    }
    
    // swipe from right to delete qoute
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, nil) in
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let qoute = self.writers[indexPath.row]
            context.delete(qoute)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                self.writers = try context.fetch(Qoutes.fetchRequest())
            }catch{
                print("Fetching faild after deletion")
            }
            tableView.reloadData()
        }
        let configuration = UISwipeActionsConfiguration(actions: [delete])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    // when user swipe from left to edit qoute
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { (action, view, nil) in
            self.sRow = indexPath.row
            self.performSegue(withIdentifier: "addQouteSegue", sender: nil)
        }
        let configuration = UISwipeActionsConfiguration(actions: [edit])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    // putting data into table row, writer names
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = writers[indexPath.row].writer
        return cell!
    }
}
