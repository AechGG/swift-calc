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
    
    private var safeNumber: Double {
        guard let convertedNumber = Double(displayLabel.text!) else { fatalError() }
        return convertedNumber;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true;
        
        if let calcMethod = sender.currentTitle {
            switch calcMethod {
            case "AC":
                displayLabel.text = String(0);
            case "%":
                displayLabel.text = String(safeNumber / 100.00);
            case "+/-":
                displayLabel.text = String(safeNumber * -1);
            default:
                displayLabel.text = String(safeNumber);
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
                    if !isInt{
                        return;
                    }
                }
                
                displayLabel.text = displayLabel.text! + number;
            }
        }
        
    }
}

