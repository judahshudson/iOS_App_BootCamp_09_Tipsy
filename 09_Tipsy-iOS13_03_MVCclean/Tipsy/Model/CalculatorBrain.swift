//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Judah Hudson on 2/10/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {

    //***FIX ME***
    func updateTip() {
        
    }
    
    func getTipMultiplier(_ percentChosen: Double) -> Double {
        return 1 + percentChosen
    }
    
    func getTotalBill(_ bill: Double,_ tipMultiplier: Double) -> Double {
        return bill * tipMultiplier
    }
    
    mutating func getTotalPerPerson(_ bill: Double,_ splitNumPeople: Int,_ percentChosen: Double) -> String {
        let tipMultiplier = getTipMultiplier(percentChosen)
        let totalBill = getTotalBill(bill, tipMultiplier)
        return String(format: "%.2f", (totalBill / Double(splitNumPeople)))
    }
    
    mutating func getSettings(_ percentChosen: Double,_ numPeople: Int) -> String {
        return "Split between \(Int(numPeople)), with \(Int(percentChosen*100))% tip"
    }

}


