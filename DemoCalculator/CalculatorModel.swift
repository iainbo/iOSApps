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
    
    private var operations: Dictionary<String, Operation> = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),
        "×": Operation.BinaryOperation({$0 * $1}),
        "÷": Operation.BinaryOperation({$0 / $1}),
        "+": Operation.BinaryOperation({$0 + $1}),
        "−": Operation.BinaryOperation({$0 - $1}),
        "=": Operation.Equals
    ]
    
    private enum Operation{
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    func performOperation(symbol: String){
        if let operation = operations[symbol]{
            switch operation{
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
            case .BinaryOperation(let function):
                executingPendingBinaryOperation()
                pending = pendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                executingPendingBinaryOperation()
            }
        }
    }
    
    private func executingPendingBinaryOperation(){
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
        }
    }
    
    //Optional property identified by ?
    private var pending: pendingBinaryOperationInfo?
    
    private struct pendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    var result: Double{
        get{
            return accumulator
        }
    }
    
}
