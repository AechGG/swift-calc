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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true;
        
        guard let number = Double(displayLabel.text!) else { fatalError() }
        if let calcMethod = sender.currentTitle {
            switch calcMethod {
            case "AC":
                displayLabel.text = String(0);
            case "%":
                displayLabel.text = String(number / 100.00);
            case "+/-":
                displayLabel.text = String(number * -1);
            default:
                displayLabel.text = String(number);
            }
        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let number = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = number;
                isFinishedTypingNumber = false;
            } else {
                displayLabel.text = displayLabel.text! + number;
            }
        }
        
    }
}

