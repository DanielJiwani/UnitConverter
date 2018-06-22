//
//  TemperatureViewController.swift
//  Converter
//
//  Created by Daniel Jiwani on 6/8/18.
//  Copyright © 2018 Daniel Jiwani. All rights reserved.
//

import UIKit

class TemperatureViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let list = Unit.allCases()
    
    @IBAction func convertUnits(_ sender: Any)
    {
        let fromUnitIdx = picker.selectedRow(inComponent: 0)
        let toUnitIdx = picker.selectedRow(inComponent: 1)
        
        let fromUnit = Unit.fromString(list[fromUnitIdx])!
        let toUnit = Unit.fromString(list[toUnitIdx])!
        
        if let inputText = input.text {
            if !inputText.isEmpty {
                let inputNum = Double(inputText)!
                let outputNum = fromUnit.convertTo(unit: toUnit, value: inputNum)
                output.text = String(outputNum)
            }
        }
    }
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var output: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenus()
        picker.delegate = self
        picker.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sideMenus() {
        if revealViewController() != nil{
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }
    
    enum Unit: Int {
        case Kelvin = 0, Celsius, Fahrenheit
        
        func description() -> String {
            switch self {
            case .Kelvin:
                return "Kelvin"
            case .Celsius:
                return "Celsius"
            case .Fahrenheit:
                return "Fahrenheit"
            }
        }
        
        func convertTo(unit to: Unit, value val: Double) -> Double {
            var convert = val
            switch self {
            case .Kelvin:
                if to == .Kelvin {
                    convert = convert + 0
                } else if to == .Celsius {
                    convert = convert - 273.15
                } else if to == .Fahrenheit {
                    convert = convert - 457.87
                }
            
            case .Celsius:
                if to == .Kelvin {
                    convert = convert + 273.15
                } else if to == .Celsius {
                    convert = convert + 0
                } else if to == .Fahrenheit {
                    convert = convert * 1.8 + 32
                }
                
            case .Fahrenheit:
                if to == .Kelvin {
                    convert = (convert + 459.67) * (5/9)
                } else if to == .Celsius {
                    convert = (convert - 32) / 1.8
                } else if to == .Fahrenheit {
                    convert = convert + 0
                }
            }
            return convert
        }
        
        static func fromString(_ string: String) -> Unit? {
            if string == "Kelvin" {
                return .Kelvin
            } else if string == "Celsius" {
                return .Celsius
            } else if string == "Fahrenheit" {
                return .Fahrenheit
            } else {
                return nil
            }
        }
        
        static func allCases() -> [String] {
            var i = 0
            var list = [String]()
            while let unit = Unit(rawValue: i) {
                list.append(unit.description())
                i = i + 1
            }
            return list
        }
        
    }
    
}


