//
//  CalcuatorModel.swift
//  TimeCalculator
//
//  Created by so on 2022/10/27.
//

import Foundation

class Calculator {
    private var accumlator: Int =  0
    private var lastOperation: String?
    
    
    
    func setOperand(operand: Int) {
        if lastOperation == "+" {
            lastOperation = nil
            accumlator = accumlator + operand
        }else if lastOperation == "-" {
                lastOperation = nil
                accumlator = accumlator - operand
        }
        else{
            accumlator = operand
        }
    }
    func performOperation(symbol: String) {
        switch symbol{
        case "-":
            lastOperation = symbol
        case "+":
            lastOperation = symbol
        default:
            break
        }
    }
    
    var result: Int{
        get{
            return accumlator
        }
    }
}
