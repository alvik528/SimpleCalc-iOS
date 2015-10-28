//
//  ViewController.swift
//  SimpleCalc2
//
//  Created by Vikram Thirumalai on 10/22/15.
//  Copyright (c) 2015 Vikram Thirumalai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var output: UILabel!
    var operation = ""
    var firstNum: Int = -1
    var secondNum: Int = 0
    var opDone = false
    var ints: [Int] = []
    
    @IBAction func equals(sender: UIButton) {
        var result = 0;
        if((firstNum != -1 && operation != "") || (operation == "count" || operation == "average")) {
            secondNum = convert(output.text!)
            switch operation {
            case "+":
                result = firstNum + secondNum
            case "-":
                result = firstNum - secondNum
            case "*":
                result = firstNum * secondNum
            case "/":
                result = firstNum / secondNum
            case "count":
                ints.append(secondNum)
                result = count(ints)
            case "average":
                ints.append(secondNum)
                result = avg(ints)
            default:
                print("invald input")
            }
        }
        
        ints = []
        opDone = true
        firstNum = -1
        secondNum = 0
        operation = ""
        output.text = ("\(result)")
    }
    
    func count(incoming:[Int]) -> Int {
        return incoming.count
    }
    
    func avg(incoming:[Int]) -> Int {
        var total = 0
        var count = incoming.count
        for var i = 0; i < incoming.count; i++ {
            total = total + incoming[i]
        }
        return (total / count)
    }
    
    func convert(incoming:String) -> Int {
        return NSNumberFormatter().numberFromString(incoming)!.integerValue
    }
    
    @IBAction func operations(sender: UIButton) {
        if(output.text != "0") {
            operation = sender.currentTitle!
            firstNum = convert(output.text!)
            output.text = "0"
        }
    }

    @IBAction func one(sender: UIButton) {
        if(output.text == "0" || opDone) {
            opDone = false;
            output.text = sender.currentTitle!
        }
        else {
            var q = sender.currentTitle!
                output!.text!.append(Array(q)[0])
        }
    }
    
    @IBAction func counter(sender: UIButton) {
        if(output.text != "0" && (operation == "count" || operation == "")) {
            ints.append(convert(output.text!))
            output.text = "0"
            operation = "count"
        }
    }
    
    @IBAction func average(sender: UIButton) {
        if(output.text != "0" && (operation == "average" || operation == "")) {
            ints.append(convert(output.text!))
            output.text = "0"
            operation = "average"
        }
    }
    
    @IBAction func fact(sender: UIButton) {
        var factorial = 1;
        if(output.text != "0") {
            var fact = convert(output.text!)
            for var i = fact; i > 0; i-- {
                factorial = factorial * i;
            }
            output.text = "\(factorial)"
            opDone = true;
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

