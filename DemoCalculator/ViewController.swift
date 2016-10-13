//
//  ViewController.swift
//  DemoCalculator
//
//  Created by Iain Bogucki on 13/10/2016.
//  Copyright © 2016 IBApp. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsCurrentlyTyping = false
    
    
    @IBAction func touchNumber(_ sender: UIButton) {
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
    

    @IBAction func performOperation(_ sender: UIButton) {
        userIsCurrentlyTyping = false
        if let mathSymbol = sender.currentTitle{
            if mathSymbol == "π" {
                display.text = String(M_PI)
            }
        }
    }


}

