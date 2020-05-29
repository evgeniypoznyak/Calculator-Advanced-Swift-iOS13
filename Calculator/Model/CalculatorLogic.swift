//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Evgeniy Poznyak on 5/26/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (number: Double, operation: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        guard let n = number else { return nil }
        switch symbol {
        case "+/-":
            return n * -1
        case "AC":
            return 0
        case "%":
            return n * 0.01
        case "=":
            return performTwoNumCalculation(n)
        default:
           intermediateCalculation = (number: n, operation: symbol)
        }
        return nil
    }
    
    private func performTwoNumCalculation (_ number2: Double)-> Double? {
        
        if let number1 = intermediateCalculation?.number,
            let operation = intermediateCalculation?.operation  {
            switch operation {
            case "+":
                return number1 + number2
            case "-":
                return number1 - number2
            case "×":
                return number1 * number2
            case "÷":
                return number1 / number2
            default:
                fatalError("operation is wrong")
            }
        }
        return nil
    }
}

