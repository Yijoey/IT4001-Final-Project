//
//  CalculatorViewController.swift
//  ConversionCalculator
//
//  Created by 赵益 on 7/14/18.
//  Copyright © 2018 Yi Zhao. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

   
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    @IBOutlet weak var outUnit: UITextField!
    @IBOutlet weak var inputUnit: UITextField!
    
    var numbers :String = ""
    var choice :Int = 1
    
    
    @IBAction func numbers(_ sender: UIButton)
    {
    
        inputDisplay.textAlignment = .right
        outputDisplay.textAlignment = .right
        
        
            numbers = numbers + String(sender.tag)
        
            inputDisplay.text = numbers
        
            print(numbers)
        
            switch choice {
            case 1:
                self.outputDisplay.text = self.fToC(numbers)
            case 2:
                self.outputDisplay.text = self.cToF(numbers)
            case 3:
                self.outputDisplay.text = self.kTom(numbers)
            case 4:
                self.outputDisplay.text = self.mTok(numbers)
            default:
                self.outputDisplay.text = "default"
            }
        
    }
    
   
    
    @IBAction func dot(_ sender: UIButton)
    {
        if inputDisplay.text != ""
        {
            numbers = numbers + "."
        
            inputDisplay.text=numbers
        }
    }
    
    @IBAction func convert(_ sender: Any)
    {
        let alert = UIAlertController(title: "choose converter",message:nil,preferredStyle:UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title:"fahrenheit to celcius",style:UIAlertActionStyle.default,handler:{ (alertAction) -> Void in
        self.inputUnit.text = "°F"
        self.outUnit.text = "°C"
        self.choice = 1
        self.inputDisplay.text = self.numbers
        if (self.numbers != "")
        {
                self.outputDisplay.text = self.fToC(self.numbers)
        }
            
        }))
        
        alert.addAction(UIAlertAction(title:"celcius to fahrenheit",style:UIAlertActionStyle.default,handler:{ (alertAction) -> Void in
            self.inputUnit.text = "°C"
            self.outUnit.text = "°F"
            self.choice = 2
            self.inputDisplay.text = self.numbers
            if (self.numbers != "")
            {
                self.outputDisplay.text = self.cToF(self.numbers)
            }
        }))
        
        alert.addAction(UIAlertAction(title:"miles to kilometers",style:UIAlertActionStyle.default,handler:{ (alertAction) -> Void in
            self.inputUnit.text = "mi"
            self.outUnit.text = "km"
            self.choice = 3
            self.inputDisplay.text = self.numbers
            if (self.numbers != "")
            {
                self.outputDisplay.text = self.mTok(self.numbers)
            }
        }))
        
        alert.addAction(UIAlertAction(title:"kilometers to miles",style:UIAlertActionStyle.default,handler:{ (alertAction) -> Void in
            self.inputUnit.text = "km"
            self.outUnit.text = "mi"
            self.choice = 4
            self.inputDisplay.text = self.numbers
            if (self.numbers != "")
            {
                self.outputDisplay.text = self.kTom(self.numbers)
            }

        }))
        
         self.present(alert, animated: true, completion: nil)
    }
    
    func fToC(_ ferenheight: String) -> String {
        
        let new: Double = Double(ferenheight)!
        
        let total = (new - 32) * (5/9)
        
        return String(format: "%.2f", total )
        
    }
    
    func cToF(_ celcius: String) -> String {
        
        let new: Double = Double(celcius)!
        
        let total = new * (9/5) + 32
        
        return String(format: "%.2f", total )
        
    }
    
    func kTom(_ kilometers: String) -> String {
        
        let new: Double = Double(kilometers)!
        let multiplier: Double = 0.62
        
        let total = new * multiplier
        
        return String(total)
        
    }
    
    func mTok(_ miles: String) -> String {
        
        let new: Double = Double(miles)!
        let multiplier: Double = 1.61
        
        let total = new * multiplier
        
        return String(total)
        
    }
    
    @IBAction func clear(_ sender: UIButton) {
       
        outputDisplay.text = ""
        inputDisplay.text = ""
        numbers = ""
    }
    
    @IBAction func changeSign(_ sender: UIButton) {
        
        if inputDisplay.text != ""
        {
        
            let convertedString: String
        
            if  inputDisplay.text != "" || inputDisplay.text != "." || inputDisplay.text != "0"
            {
                if let fieldText = inputDisplay.text
                {
                    if var convertedNumber = Double(fieldText)
                    {
                        convertedNumber = convertedNumber * (-1)
                        
                        convertedString = String(convertedNumber)
                        
                        numbers = convertedString
                    }
                    
                }
            }
        
            inputDisplay.text = numbers
            switch choice {
            case 1:
                self.outputDisplay.text = self.fToC(numbers)
            case 2:
                self.outputDisplay.text = self.cToF(numbers)
            case 3:
                self.outputDisplay.text = self.kTom(numbers)
            case 4:
                self.outputDisplay.text = self.mTok(numbers)
            default:
                self.outputDisplay.text = "default"
            }
        }
    }
    
    struct Converter{
        var Label: String
        var input: String
        var output: String
    }
    var converters = [
        Converter(Label: "fahrenheit to celcius", input: "°F", output: "°C"),
        Converter(Label: "celcius to fahrenheit", input:"°C", output: "°F"),
        Converter(Label: "miles to kilometers", input: "mi", output: "km"),
        Converter(Label: "kilometers to miles", input: "km", output: "mi")
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputDisplay.textAlignment = .right
        inputDisplay.textAlignment = .right
        
        self.outUnit.text = "°C"
        self.inputUnit.text = "°F"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


