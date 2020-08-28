//
//  ViewController.swift
//  swift-calc
//
//  Created by Harrison Gittos on 04/08/2020.
//  Copyright © 2020 Harrison Gittos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true;
    
    private var calcLogic = CalcLogic();
    
    private var safeNumber: Double {
        get {
            guard let convertedNumber = Double(displayLabel.text!) else { fatalError() }
            return convertedNumber;
        }
        set {
            displayLabel.text = String(newValue);
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true;
        
        if let calcMethod = sender.currentTitle {
            calcLogic.setNumber(safeNumber)
            if let safeResult = calcLogic.calculate(calcMethod)  {
                safeNumber = safeResult;
            }
        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let number = sender.currentTitle {
            if isFinishedTypingNumber {
                if number == "." {
                    displayLabel.text = "0\(number)";
                } else {
                    displayLabel.text = number;
                }
                isFinishedTypingNumber = false;
            } else {
                if number == "." {
                    let isInt = floor(safeNumber) == safeNumber;
                    if !isInt {
                        return;
                    }
                }
                
                displayLabel.text = displayLabel.text! + number;
            }
        }
        
    }
}

