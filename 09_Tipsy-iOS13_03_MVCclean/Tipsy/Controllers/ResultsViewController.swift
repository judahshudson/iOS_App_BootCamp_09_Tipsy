//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Judah Hudson on 2/9/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var total: String?
    var settings: String?

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //get our results to show up on screen
        totalLabel.text = total
        settingsLabel.text = settings
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        //return to first screen
        self.dismiss(animated: true, completion: nil)
    }

}
