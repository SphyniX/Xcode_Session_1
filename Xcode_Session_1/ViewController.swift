//
//  ViewController.swift
//  Xcode_Session_1
//
//  Created by RicherTecMac Pro on 2016/9/9.
//  Copyright © 2016年 KJSA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    
    private var  userIsInTheMiddleOfTyping  = false
    
    @IBOutlet weak var displayHistory: UILabel!
    
    @IBAction private func touchDigit(sender: UIButton  )  {
        
        let digit  = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping   {
            
            let textCurrentlyInDisplay = display!.text!
            display!.text = textCurrentlyInDisplay + digit
            
            }else{
            
            display.text = digit
            
            
        }
        if let historyOnDispaly = displayHistory.text{
            brain.showOperationHistory(digit, history: historyOnDispaly)
        }
        displayHistory.text = brain.historyResult
        userIsInTheMiddleOfTyping = true
            
        }
    
    private var displayValue : Double{
        
        get{
            return Double(display.text!)!
        }
        
        set{
            display.text = String(newValue)
        }
        
    
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(sender: UIButton) {
        if userIsInTheMiddleOfTyping{
            brain.setOperand(displayValue)
        
            userIsInTheMiddleOfTyping = false
        }
        if let mathmaticalSymbol = sender.currentTitle{
            
            if let historyOnDispaly = displayHistory.text{
                brain.showOperationHistory(mathmaticalSymbol, history: historyOnDispaly)
            }
            brain.performOperation(mathmaticalSymbol)
           
            
           // -----
//            if mathmaticalSymbol == "π"{
//                displayValue = M_PI
//                
//            }else if mathmaticalSymbol == "√"{
//                displayValue = sqrt(displayValue)
//            }
        }
        displayValue = brain.result
        displayHistory.text = brain.historyResult
    }




}

