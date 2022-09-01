//
//  ViewController.swift
//  CalculatorApp
//
//  Created by shahina kassim on 25/08/2022.
//

import UIKit

class ViewController: UIViewController {

    var operation: Operators = .nothing
    var firstNumber = ""
    var clacState: CalcStates = .eneteringNum
    var resultValue = ""
 
    @IBOutlet weak var labelText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // commit example
        print("hello world")
        //sdjcjsdhfvjsfhjvhdfjvf
        // Do any additional setup after loading the view.
    }

    @IBAction func numberClicked(_ sender: UIButton){
        
        switch clacState {



        case .newNum:
            labelText.text = "\(sender.tag)"
            clacState = .eneteringNum


        case .eneteringNum:
            if let value = labelText.text{
                if(value == ""){
                    labelText.text = "\(sender.tag)"
                }
                else{
                    labelText.text = value + "\(sender.tag)"
                }
            }
            else{
                labelText.text = "\(sender.tag)"
            }
        }
        
    }
   
    @IBAction func operatorClicked(_ sender: UIButton){
        clacState = CalcStates.newNum
        updateOperatorButtonColor(number: sender.tag)
        if let value = labelText.text{
            firstNumber = value
            
        }
        else{
            return
        }
        labelText.text = ""
        switch sender.tag{
        case 10:
            operation = .add
            break
        case 11:
            operation = .subtract
            break
        case 12:
            operation = .multiplication
            print("multiply")
            break
        case 13:
            operation = .division
            print("divide")
            break
        default: break
        }
    }
    func updateOperatorButtonColor(number : Int){
        for item in 10..<14 {
            if let button = self.view.viewWithTag(item) as? UIButton{
                button.layer.backgroundColor = UIColor.clear.cgColor
            }
        }
        if let buttonChange = self.view.viewWithTag(number) as? UIButton{
            buttonChange.layer.backgroundColor = UIColor.yellow.cgColor
        }
        
    }
    @IBAction func equalsClicked(_ sender: UIButton){
        calculateValue()
        clacState = .newNum
        
    }
    
    func calculateValue() {
        var secondValue = labelText.text
       
        if firstNumber.isEmpty{
            return
        }
        else{
            
        var numberOne = Double(firstNumber)!
        var secondOne = Double(labelText.text ?? "")!
        switch operation{
               
                case .add:
                    resultValue = "\(numberOne + secondOne)"
                case .subtract:
                    resultValue = "\(numberOne - secondOne)"
                case .multiplication:
                    resultValue = "\(numberOne * secondOne)"
                case .division:
                    resultValue = "\(numberOne / secondOne)"
                case .nothing:
                    resultValue = ""
        }
            firstNumber = resultValue
            labelText.text = resultValue
        
       
        
        }
    }
}
