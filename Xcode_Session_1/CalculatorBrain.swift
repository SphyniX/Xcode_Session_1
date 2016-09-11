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
    
    private var usingReturnHistoryReslut = ""
    
    private var clearFlog = false
    
    func setOperand(operand : Double){
    
        accumulator = operand
        
    }
    
    

    private var operations : Dictionary <String,Operation> = [
        "π" : Operation.Constant(M_PI),   //M_PI,
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "±" : Operation.UnaryOperation({-$0}),
        "cos" : Operation.UnaryOperation(cos),
        "×" : Operation.BinaryOperation({ $0 * $1}),
        "+" : Operation.BinaryOperation({ $0 + $1}),
        "−" : Operation.BinaryOperation({ $0 - $1}),
        "÷" : Operation.BinaryOperation({ $0 / $1}),
        "=" : Operation.Equals
    ]
    
    private enum Operation{
        
        case Constant(Double)
        case UnaryOperation((Double)->Double)
        case BinaryOperation((Double,Double)->Double)
        case Equals
    
    }
    
    func showOperationHistory(symbol : String,history : String){
        print(symbol)
        if clearFlog{
            usingReturnHistoryReslut = symbol
        }else{
            usingReturnHistoryReslut = history + symbol
        }
        clearFlog = false
    }
    
    func performOperation(symbol : String){
        
        if let operation = operations[symbol]{
            switch operation{
            case .Constant(let value) : accumulator = value
            case .UnaryOperation(let function) : accumulator = function(accumulator)
            case .BinaryOperation(let function):
                executPendingBinaryOperation()
                Pending = PendingBinaryOperationInfo(binaryFunction: function, fristOperand: accumulator)
            case .Equals :
                clearFlog = true
                executPendingBinaryOperation()
            }
        }
    }
    
    private func executPendingBinaryOperation(){
        if Pending != nil{
            accumulator = Pending!.binaryFunction(Pending!.fristOperand,accumulator)
            Pending = nil
        }
    
    }
    
    private var Pending : PendingBinaryOperationInfo?
    
    private struct PendingBinaryOperationInfo {
        var binaryFunction:(Double,Double) ->Double
        var fristOperand : Double
    }
    
    var result : Double{
    
        get{
            return accumulator
        }
    
    }
    
    var historyResult : String{
    
        get{
            return usingReturnHistoryReslut
        }
    }
    
}