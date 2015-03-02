//
//  ViewController.swift
//  calculator
//
//  Created by zx on 2/28/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingNumber: Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingNumber {
            display.text = display.text! + digit
        }else {
            display.text = digit;
            userIsInTheMiddleOfTypingNumber = true;
        }
        
    }
    
    var operandStack = Array<Double>()
    
    
    @IBAction func enter(sender: UIButton) {
        userIsInTheMiddleOfTypingNumber = false
        operandStack.append(displayValue)
        println("operandStack  = \(operandStack)")
    }
    
    @IBAction func operate(sender: UIButton) {
        if userIsInTheMiddleOfTypingNumber {
            enter(sender)
        }
        let operation = sender.currentTitle!
        
        switch operation {
            case "×": performOperation(multiply)
            case "÷": performOperation(divide)
            case "+": performOperation(add)
            case "−": performOperation(minus)
        default: break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast() ,operandStack.removeLast())
        }
    }
    
    func multiply(op1: Double , op2: Double) -> Double {
        return op1 * op2
    }
    
    func divide(op1: Double, op2: Double) -> Double {
        return op1 / op2
    }
    
    func add(op1: Double, op2: Double) -> Double {
        return op1 + op2
    }
    
    func minus(op1: Double, op2: Double) -> Double {
        return op1 - op2
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue;
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingNumber = false
        }
    }
}

