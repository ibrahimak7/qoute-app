//
//  ViewQouteController.swift
//  Qoutes
//
//  Created by Ibrahim on 11/09/2018.
//  Copyright © 2018 Ibrahim kk. All rights reserved.
//

import UIKit

class ViewQouteController: UIViewController {

    
    @IBOutlet weak var qouteTextView: UITextView!
    
    @IBOutlet weak var writerName: UILabel!
    
    var sRow: Int!
    var qoutesData = [Qoutes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        qouteTextView.text = qoutesData[sRow].qoute
        writerName.text = qoutesData[sRow].writer
    }

    


}
