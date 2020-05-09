//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    var percentChosen = 0.0 //track % user chose
    var amountPerPerson = "Let's order first"
    var numPeople = 0.0
    var bill = 0.0

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        //***FIX ME***
        calculatorBrain.updateTip()
        
        //highlight % button pressed
        if sender.currentTitle == "0%" {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            percentChosen = 0.0 //track % user chose
        } else if sender.currentTitle == "10%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            percentChosen = 0.1
        } else if sender.currentTitle == "20%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            percentChosen = 0.2
        }
        
        billTextField.endEditing(true)  //turns off number pad
    }
    
    @IBAction func stepValueChanged(_ sender: UIStepper) {
        //split label displays updated value
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        bill = Double(billTextField?.text ?? "default value") ?? 0
        numPeople = Double(splitNumberLabel.text ?? "default value") ?? 0.0
        
        // connect to ResultsViewController via Main.storyboard
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            
            //display result on second screen
            destinationVC.total = calculatorBrain.getTotalPerPerson(bill, Int(numPeople), percentChosen)
            destinationVC.settings = calculatorBrain.getSettings(percentChosen, Int(numPeople))
        }
    }
    
}

