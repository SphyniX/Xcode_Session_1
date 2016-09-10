//
//  CalculatorBrain.swift
//  Xcode_Session_1
//
//  Created by 焦俊豪 on 16/9/10.
//  Copyright © 2016年 KJSA. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    private var accumulator = 0.0
    
    func setOperand(operand : Double){
    
        accumulator = operand
        
    }
    
    func performOperation(symbol : String){
        
        switch symbol {
            case "π":accumulator = M_PI
            case "√":accumulator = sqrt(accumulator)
            default : break
        }
    
    }
    
    var result : Double{
    
        get{
            return accumulator
        }
    
    }
    
}