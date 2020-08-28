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
    
    mutating func setNumber(_ number: Double) {
        self.number = number;
    }
    
    func calculate(_ symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "AC":
                return 0;
            case "%":
                return n / 100.00;
            case "+/-":
                return n * -1;
            case "+":
                return n + 1;
            case "=":
                return n * 2;
            default:
                return nil;
            }
        }
        return nil;
        
    }
}
