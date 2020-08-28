//
//  CalcLogic.swift
//  swift-calc
//
//  Created by Harrison Gittos on 28/08/2020.
//  Copyright © 2020 Harrison Gittos. All rights reserved.
//

import Foundation

struct CalcLogic {
    
    var number: Double;
    
    init(number: Double) {
        self.number = number;
    }
    
    func calculate(_ symbol: String) -> Double? {
            switch symbol {
            case "AC":
                return 0;
            case "%":
                return number / 100.00;
            case "+/-":
                return number * -1;
            default:
                return nil;
        }
    }
}
