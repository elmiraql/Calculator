//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Elmira on 19.02.21.
//

import Foundation

struct CalculatorLogic {
   
    var number: Double?
    
    private var intermediatCalculation: (firstNum: Double, operation: String)?
    
    mutating func setNumber (num: Double){
        self.number = num
    }
    
    mutating func logicCalc (symbol: String) -> Double? {
        if let n = number {
        if symbol == "+/-" {
            return n * -1
        } else if symbol == "C" {
            return 0
        } else if symbol == "%" {
            return n / 100
        } else if symbol == "=" {
            return performCalculation(n2:n)
        } else {
            intermediatCalculation = (firstNum: n, operation: symbol)
         }
        }
        return nil

    }
    
    func performCalculation (n2: Double) -> Double? {
        if let n1 = intermediatCalculation?.firstNum, let sign = intermediatCalculation?.operation {
            if sign == "+" {
                return n1 + n2
            } else if sign == "-" {
                return n1 - n2
            } else if sign == "/" {
                return n1 / n2
            } else if sign == "*" {
                return n1 * n2
            }
        }
        return nil
    }
    
}
