//
//  ViewController.swift
//  Calculator
//
//  Created by Juniper on 1/19/16.
//  Copyright © 2016 DePaul University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        displayValue = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var displayIsClean: Bool = true
    var old: Double = 0
    var op: String = "+"
    
    var displayValue: Double {
        get {
            return Double(Display.text!)!
        }
        set {
            Display.text = "\(newValue)"
        }
    }
    
    @IBOutlet weak var Display: UILabel!

    @IBAction func DigitPressed(_ sender: UIButton!) {
        if(displayIsClean){
            old = displayValue
            Display.text = sender.currentTitle
            displayIsClean = false;
        } else {
            appendDigit(sender.currentTitle!)
        }
        
    }
    
    @IBAction func opPressed(_ sender: UIButton) {
        let v = Evaluate()
        if(!displayIsClean){
            old = displayValue
        }
        
        displayValue = v
        op = sender.currentTitle!
        displayIsClean = true
    }
    
    @IBAction func clear() {
        displayValue = 0
        old = 0
        op = "+"
        displayIsClean = true
    }
    
    func appendDigit(_ num :String){
        Display.text!.append(num)
    }
    
    
    func Evaluate() -> Double {
        
        switch(op){
        
        case "=":
            return displayValue
        case "+":
            return old + displayValue
        case "−":
            return old - displayValue
        case "×":
            return old * displayValue
        case "÷":
                return old / displayValue
        default:
            return 0.0
        }
    
    }
}
