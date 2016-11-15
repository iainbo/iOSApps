//
//  ViewController.swift
//  DemoCalculator
//
//  Created by Iain Bogucki on 13/10/2016.
//  Copyright © 2016 IBApp. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    
    private var userIsCurrentlyTyping = false
    
    
    @IBAction private func touchNumber(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsCurrentlyTyping{
            if digit == "."{
                if !(display.text?.contains("."))!{
                    appendText(digit: digit)
                }
            }else{
                appendText(digit: digit)
            }
            
        }
        else{
            display.text = digit
        }
        userIsCurrentlyTyping = true
    }
    
    private func appendText(digit: String){
        let textCurrentlyInDisplay = display.text!
        display.text = textCurrentlyInDisplay + digit
    }
    
    //Computed property identified by curly braces after
    //Does the conversion of String to Double when dealing with the display
    private var displayValue: Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    var savedProgram: CalculatorModel.PropertyList?
    
    @IBAction func save() {
        savedProgram = model.program
    }
    
    @IBAction func restore() {
        if savedProgram != nil{
            model.program = savedProgram!
            displayValue = model.result
        }
    }
    
    @IBAction func clear() {
        display.text = String(0.0)
        model.clear()
    }

    private var model = CalculatorModel()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsCurrentlyTyping {
            model.setOperand(operand: displayValue)
            userIsCurrentlyTyping = false
        }
        if let mathSymbol = sender.currentTitle{
            model.performOperation(symbol: mathSymbol)
        }
        displayValue = model.result
    }
}

