//
//  CalcuatorModel.swift
//  TimeCalculator
//
//  Created by so on 2022/10/27.
//

import Foundation

class Calculator {
    private var accumlator: Double =  0.0
    private var lastOperation: String?
    
    
    
    func setOperand(operand: Double) {
        if lastOperation == "+" {
            lastOperation = nil
            accumlator = accumlator + operand
            let interval = accumlator

            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.hour, .minute]
            formatter.unitsStyle = .positional

            let formattedString = formatter.string(from: TimeInterval(interval))!
            print(formattedString)
            
            
        }else if lastOperation == "-" {
                lastOperation = nil
                accumlator = accumlator - operand
            let interval = accumlator

            let formatter = DateComponentsFormatter()
           
            formatter.allowedUnits = [.hour, .minute]
            formatter.unitsStyle = .positional

            let formattedString = formatter.string(from: TimeInterval(interval))!
            print(formattedString)
        }
        else{
            accumlator = operand
            
            let interval = accumlator

            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.hour, .minute]
            formatter.unitsStyle = .positional

            let formattedString = formatter.string(from: TimeInterval(interval))!
            print(formattedString)
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
    
    var result: Double{
        get{
            return accumlator
            
            
            
        }
    }
}
