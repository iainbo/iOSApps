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
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }
        else{
            display.text = digit
        }
        userIsCurrentlyTyping = true
    }
    
    //Computed property identified by curly braces after
    private var displayValue: Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
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

