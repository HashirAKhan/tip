//
//  ViewController.swift
//  tip
//
//  Created by Hashir Khan on 11/23/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountSegmentView: UISegmentedControl!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var twoSplit: UILabel!
    @IBOutlet weak var threeSplit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.keyboardType = .decimalPad
        billAmountTextField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        if billAmountTextField.text! == ""{
            billAmountTextField.text! = "$"
        }
        
        for i in 0...billAmountTextField.text!.count-1{
            let index = billAmountTextField.text!.startIndex
            if !billAmountTextField.text![billAmountTextField.text!.index(index, offsetBy: i)].isNumber
                && !(billAmountTextField.text![billAmountTextField.text!.index(index, offsetBy: i)] == Character("$")
                        || billAmountTextField.text![billAmountTextField.text!.index(index, offsetBy: i)] == "."){
                billAmountTextField.text!.remove(at: billAmountTextField.text!.index(index, offsetBy: i))
            }
        }
        
//        if !billAmountTextField.text![billAmountTextField.text!.endIndex].isNumber
//        && !(billAmountTextField.text![billAmountTextField.text!.endIndex] == Character("$")
//        || billAmountTextField.text![billAmountTextField.text!.endIndex] == Character(".")){
//            billAmountTextField.text!.remove(at: billAmountTextField.text!.endIndex)
//        }
        
        var temp = billAmountTextField.text!
        temp.remove(at: temp.startIndex)
        let bill = Double(temp) ?? 0
        let tipPercentages = [0.15, 0.18, 0.20]
        
        
        let tip = bill * tipPercentages[tipAmountSegmentView.selectedSegmentIndex]
        let total = bill + tip
        
        tipPercentLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
        twoSplit.text = String(format:"$%.2f", total/2)
        threeSplit.text = String(format:"$%.2f", total/3)
    }
    
}

