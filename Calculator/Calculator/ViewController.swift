//
//  ViewController.swift
//  Calculator
//
//  Created by Emir on 6.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var Result: String = ""
    
    @IBOutlet weak var ResultScreen: UILabel!
    @IBOutlet weak var PreviousResult: UILabel!
    
    func addToResult(value: String){
        Result += value
        ResultScreen.text = Result
    }
    
    func valueInput() -> Bool {
        return true
    }
    
    func formatResult(result: Double) -> String {
        if(result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }

    @IBAction func numbers(_ sender: UIButton) {
        addToResult(value: String(sender.tag))
    }
    
    @IBAction func allClear(_ sender: Any) {
        Result = ""
        PreviousResult.text = ResultScreen.text
        ResultScreen.text = ""
    }
    @IBAction func brackets(_ sender: Any) {
        if (Result.hasPrefix("(")){
            addToResult(value: ")")
        } else {
            addToResult(value: "(")
        }
    }
    @IBAction func symbols(_ sender: UIButton) {
        if(sender.currentTitle == "X") {
            addToResult(value: "*")
        } else {
            addToResult(value: sender.currentTitle!)
        }
    }
    @IBAction func equals(_ sender: Any) {
        if(valueInput()){
            let checkedResultForPercentage = Result.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedResultForPercentage)
            let result = expression.expressionValue(with: nil, context: nil)
            ResultScreen.text = formatResult(result: result as! Double)
        }
    }
    @IBAction func deleteLast(_ sender: Any) {
        if(!Result.isEmpty) {
            Result.removeLast()
            ResultScreen.text = Result
        }
    }
}
