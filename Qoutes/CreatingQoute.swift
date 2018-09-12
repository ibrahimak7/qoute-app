//
//  CreatingQoute.swift
//  Qoutes
//
//  Created by Ibrahim on 10/09/2018.
//  Copyright © 2018 Ibrahim kk. All rights reserved.
//

import UIKit
import CoreData
class CreatingQoute: UIViewController {
    var num: Int?
    var qoutesData = [Qoutes]()
    
    @IBOutlet weak var qouteTextView: UITextView!
    
    @IBOutlet weak var writerName: UITextField!
    
    @IBOutlet weak var savingAndUpdatingQoute: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        changeButtonTitle()
    }
    
    @IBAction func savingAndUpdatingQoute(_ sender: Any) {
        
        // checking if qoute is new or needs to be updated
        if savingAndUpdatingQoute.titleLabel?.text == "Save Qoute"{
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            // getting access to entity Qoutes using contianer
            let qoutes = Qoutes(context: context)
            // inserting data into core data
            qoutes.qoute = qouteTextView.text
            qoutes.writer = writerName.text
            
            print("data inserted")
            }else{
            // updating values in core data
            qoutesData[num!].setValue(qouteTextView.text, forKey: "qoute")
            qoutesData[num!].setValue(writerName.text, forKey: "writer")
            print("Data updated")
            }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
        
    }
    func changeButtonTitle() {
        
        // it chnages the button title if qoute is new or already created and needs to updated
        if num != nil {
            savingAndUpdatingQoute.setTitle("Update Qoute", for: .normal)
            
            // one thing more here
            // putting qoute text in field to update
            qouteTextView.text = qoutesData[num!].qoute
            writerName.text = qoutesData[num!].writer
            }else{
            savingAndUpdatingQoute.setTitle("Save Qoute", for: .normal)
        }
    }
    

}
