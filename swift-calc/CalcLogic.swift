//
//  CalcLogic.swift
//  swift-calc
//
//  Created by Harrison Gittos on 28/08/2020.
//  Copyright © 2020 Harrison Gittos. All rights reserved.
//

import Foundation

struct CalcLogic {
    
    private var number: Double?;
    
    private var intermediateCalc: (n1: Double, calcMethod: String)?;
    
    mutating func setNumber(_ number: Double) {
        self.number = number;
    }
    
    mutating func calculate(_ symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "AC":
                return 0;
            case "%":
                return n / 100.00;
            case "+/-":
                return n * -1;
            case "=":
                return performTwoNumCalculation(n2: n);
            default:
                intermediateCalc = (n1: n, calcMethod: symbol);
            }
        }
        return nil;
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalc?.n1, let calcMethod = intermediateCalc?.calcMethod {
            switch calcMethod {
            case "+":
                return n1 + n2;
            case "-":
                return n1 + n2;
            case "×":
                return n1 + n2;
            case "÷":
                return n1 + n2;
            default:
                fatalError("Error with symbols");
            }
        }
        return nil;
    }
    
}
