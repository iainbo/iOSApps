//
//  CalculatorModel.swift
//  DemoCalculator
//
//  Created by Iain Bogucki on 15/10/2016.
//  Copyright © 2016 IBApp. All rights reserved.
//

import Foundation

class CalculatorModel{
    
    private var accumulator = 0.0
    
    func setOperand(operand: Double){
        accumulator = operand
    }
    
    func performOperation(symbol: String){
        switch symbol{
        case "π": accumulator = M_PI
        case "√": accumulator = sqrt(accumulator)
        default: break
        }
    }
    
    var result: Double{
        get{
            return accumulator
        }
    }
    
}
