//
//  VolumeViewController.swift
//  Converter
//
//  Created by Daniel Jiwani on 6/8/18.
//  Copyright © 2018 Daniel Jiwani. All rights reserved.
//

import UIKit

class VolumeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let list = Unit.allCases()
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var output: UITextField!
    
    @IBAction func convertUnits(_ sender: Any) {
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
        case Milliliter = 0, Liter, CubicMeter, Teaspoon, Tablespoon, FluidOunce, Cup, Pint, Quart, Gallon
        
        func description() -> String {
            switch self {
            case .Milliliter:
                return "Milliliter"
            case .Liter:
                return "Liter"
            case .CubicMeter:
                return "Cubic Meter"
            case .Teaspoon:
                return "Teaspoon"
            case .Tablespoon:
                return "Tablespoon"
            case .FluidOunce:
                return "Fluid Ounce"
            case .Cup:
                return "Cup"
            case .Pint:
                return "Pint"
            case .Quart:
                return "Quart"
            case .Gallon:
                return "Gallon"
            }
        }
        
        func convertTo(unit to: Unit, value val: Double) -> Double {
            var constant = 1.0
            switch self {
            case .Milliliter:
                if to == .Milliliter {
                    constant = constant + 0
                } else if to == .Liter {
                    constant = 0.001
                } else if to == .CubicMeter {
                    constant = 1e-6
                } else if to == .Teaspoon {
                    constant = 0.202884
                } else if to == .Tablespoon {
                    constant = 0.067628
                } else if to == .FluidOunce {
                    constant = 0.033814
                } else if to == .Cup {
                    constant = 0.00416667
                } else if to == .Pint {
                    constant = 0.00211338
                } else if to == .Quart {
                    constant = 0.00105669
                }  else if to == .Gallon {
                    constant = 0.000264172
                }
                
            
            case .Liter:
                if to == .Milliliter {
                    constant = 1000
                } else if to == .Liter {
                    constant = constant + 0
                } else if to == .CubicMeter {
                    constant = 0.001
                } else if to == .Teaspoon {
                    constant = 202.884
                } else if to == .Tablespoon {
                    constant = 67.628
                } else if to == .FluidOunce {
                    constant = 33.814
                } else if to == .Cup {
                    constant = 4.16667
                } else if to == .Pint {
                    constant = 2.11338
                } else if to == .Quart {
                    constant = 1.05669
                }  else if to == .Gallon {
                    constant = 0.264172
                }
                
            case .CubicMeter:
                if to == .Milliliter {
                    constant = 1e+6
                } else if to == .Liter {
                    constant = 1000
                } else if to == .CubicMeter {
                    constant = constant + 0
                } else if to == .Teaspoon {
                    constant = 202884
                } else if to == .Tablespoon {
                    constant = 67628
                } else if to == .FluidOunce {
                    constant = 33814
                } else if to == .Cup {
                    constant = 4166.67
                } else if to == .Pint {
                    constant = 2113.38
                } else if to == .Quart {
                    constant = 1056.69
                }  else if to == .Gallon {
                    constant = 264.172
                }
                
            case .Teaspoon:
                if to == .Milliliter {
                    constant = 4.92892
                } else if to == .Liter {
                    constant = 0.00492892
                } else if to == .CubicMeter {
                    constant = 4.9289e-6
                } else if to == .Teaspoon {
                    constant = constant + 0
                } else if to == .Tablespoon {
                    constant = 0.333333
                } else if to == .FluidOunce {
                    constant = 0.166667
                } else if to == .Cup {
                    constant = 0.0205372
                } else if to == .Pint {
                    constant = 0.0104167
                } else if to == .Quart {
                    constant = 0.00520833
                }  else if to == .Gallon {
                    constant = 0.00130208
                }
                
            case .Tablespoon:
                if to == .Milliliter {
                    constant = 14.7868
                } else if to == .Liter {
                    constant = 0.0147868
                } else if to == .CubicMeter {
                    constant = 1.4787e-5
                } else if to == .Teaspoon {
                    constant = 3
                } else if to == .Tablespoon {
                    constant = constant + 0
                } else if to == .FluidOunce {
                    constant = 0.5
                } else if to == .Cup {
                    constant = 0.0616115
                } else if to == .Pint {
                    constant = 0.03125
                } else if to == .Quart {
                    constant = 0.015625
                }  else if to == .Gallon {
                    constant = 0.00390625
                }
                
            case .FluidOunce:
                if to == .Milliliter {
                    constant = 29.5735
                } else if to == .Liter {
                    constant = 0.0295735
                } else if to == .CubicMeter {
                    constant = 2.9574e-5
                } else if to == .Teaspoon {
                    constant = 6
                } else if to == .Tablespoon {
                    constant = 2
                } else if to == .FluidOunce {
                    constant = constant + 0
                } else if to == .Cup {
                    constant = 0.123223
                } else if to == .Pint {
                    constant = 0.0625
                } else if to == .Quart {
                    constant = 0.03125
                }  else if to == .Gallon {
                    constant = 0.0078125
                }
                
            case .Cup:
                if to == .Milliliter {
                    constant = 240
                } else if to == .Liter {
                    constant = 0.24
                } else if to == .CubicMeter {
                    constant = 0.00024
                } else if to == .Teaspoon {
                    constant = 48.6922
                } else if to == .Tablespoon {
                    constant = 16.2307
                } else if to == .FluidOunce {
                    constant = 8.11537
                } else if to == .Cup {
                    constant = constant + 0
                } else if to == .Pint {
                    constant = 0.50721
                } else if to == .Quart {
                    constant = 0.253605
                }  else if to == .Gallon {
                    constant = 0.0634013
                }
                
            case .Pint:
                if to == .Milliliter {
                    constant =  473.176
                } else if to == .Liter {
                    constant = 0.473176
                } else if to == .CubicMeter {
                    constant = 0.000473176
                } else if to == .Teaspoon {
                    constant = 96
                } else if to == .Tablespoon {
                    constant = 32
                } else if to == .FluidOunce {
                    constant = 16
                } else if to == .Cup {
                    constant = 1.97157
                } else if to == .Pint {
                    constant = constant + 0
                } else if to == .Quart {
                    constant = 0.5
                }  else if to == .Gallon {
                    constant = 0.125
                }
                
            case .Quart:
                if to == .Milliliter {
                    constant = 946.353
                } else if to == .Liter {
                    constant = 0.946353
                } else if to == .CubicMeter {
                    constant = 0.000946353
                } else if to == .Teaspoon {
                    constant = 192
                } else if to == .Tablespoon {
                    constant = 64
                } else if to == .FluidOunce {
                    constant = 32
                } else if to == .Cup {
                    constant = 3.94314
                } else if to == .Pint {
                    constant = 2
                } else if to == .Quart {
                    constant = constant + 0
                }  else if to == .Gallon {
                    constant = 0.25
                }
                
            case .Gallon:
                if to == .Milliliter {
                    constant =  3785.41
                } else if to == .Liter {
                    constant = 3.78541
                } else if to == .CubicMeter {
                    constant = 0.00378541
                } else if to == .Teaspoon {
                    constant = 768
                } else if to == .Tablespoon {
                    constant = 256
                } else if to == .FluidOunce {
                    constant = 128
                } else if to == .Cup {
                    constant = 15.7725
                } else if to == .Pint {
                    constant = 8
                } else if to == .Quart {
                    constant = 4
                }  else if to == .Gallon {
                    constant = constant + 0
                }
            }
            return constant * val
        }
        
        static func fromString(_ string: String) -> Unit? {
            if string == "Milliliter" {
                return .Milliliter
            } else if string == "Liter" {
                return .Liter
            } else if string == "Cubic Meter" {
                return .CubicMeter
            } else if string == "Teaspoon" {
                return .Teaspoon
            } else if string == "Tablespoon" {
                return .Tablespoon
            } else if string == "Fluid Ounce" {
                return .FluidOunce
            } else if string == "Cup" {
                return .Cup
            } else if string == "Pint" {
                return .Pint
            } else if string == "Quart" {
                return .Quart
            } else if string == "Gallon" {
               return .Gallon
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



