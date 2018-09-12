//
//  QoutesViewController.swift
//  Qoutes
//
//  Created by Ibrahim on 10/09/2018.
//  Copyright © 2018 Ibrahim kk. All rights reserved.
//

import UIKit
import CoreData

class QoutesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var writers: [Qoutes] = []
    var sRow: Int?
    @IBOutlet weak var tableView: UITableView!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addQouteSegue" {
            let destinationVC = segue.destination as! CreatingQoute
            destinationVC.num = sRow
            destinationVC.qoutesData = writers
            
        }
        
        if segue.identifier == "toViewQoute" {
            let destinationVC = segue.destination as! ViewQouteController
            destinationVC.sRow = sRow
            destinationVC.qoutesData = writers
            
        }
    }
    
    @IBAction func addingQouteBtn(_ sender: Any) {
        self.sRow = nil
        print("adding qoute pressed")
        performSegue(withIdentifier: "addQouteSegue", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        // access qoutes writer names from core data
        getQoues()
        
        // reloading table data
        tableView.reloadData()
    }
    
    func getQoues(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            writers = try context.fetch(Qoutes.fetchRequest())
        }catch{
            print("Error occured in fetching")
        }
        }


}
