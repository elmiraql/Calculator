//
//  ViewController.swift
//  Calculator
//
//  Created by Elmira on 18.02.21.
//

import UIKit

class ViewController: UIViewController {
    
    private var calculatorLogic = CalculatorLogic()
    @IBOutlet weak var displayLabel: UILabel!
    private var digitTyped: Bool = true
    private var displayedValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
       
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        digitTyped = true
        calculatorLogic.setNumber(num: displayedValue)
        if let calcMethod = sender.currentTitle {
             if let result = calculatorLogic.logicCalc(symbol: calcMethod)  {
                displayedValue = result
            }
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            if digitTyped {
                displayLabel.text = numValue
                digitTyped = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayedValue) == displayedValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
}

