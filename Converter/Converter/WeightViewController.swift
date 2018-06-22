//
//  WeightViewController.swift
//  Converter
//
//  Created by Daniel Jiwani on 6/8/18.
//  Copyright © 2018 Daniel Jiwani. All rights reserved.
//

import UIKit

class WeightViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
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
        case Kilogram = 0, Gram, Miligram, Pound, Ounce, Ton
        
        func description() -> String {
            switch self {
            case .Kilogram:
                return "Kilogram"
            case .Gram:
                return "Gram"
            case .Miligram:
                return "Miligram"
            case .Pound:
                return "Pound"
            case .Ounce:
                return "Ounce"
            case .Ton:
                return "Ton"
            }
        }
        
        func convertTo(unit to: Unit, value val: Double) -> Double {
            var constant = 1.0
            switch self {
            case .Kilogram:
                if to == .Kilogram {
                    constant = constant + 0
                } else if to == .Gram {
                    constant = 1000
                } else if to == .Miligram {
                    constant = 1e+6
                } else if to == .Pound {
                    constant = 2.20462
                } else if to == .Ounce {
                    constant = 35.274
                } else if to == .Ton {
                    constant = 0.00110231
                }
            case .Gram:
                if to == .Kilogram {
                    constant = 0.001
                } else if to == .Gram {
                    constant = constant + 0
                } else if to == .Miligram {
                    constant = 1000
                } else if to == .Pound {
                    constant = 0.00220462
                } else if to == .Ounce {
                    constant = 0.035274
                } else if to == .Ton {
                    constant = 1.1023e-6
                }
            case .Miligram:
                if to == .Kilogram {
                    constant = 1e-6
                } else if to == .Gram {
                    constant = 0.001
                } else if to == .Miligram {
                    constant = constant + 0
                } else if to == .Pound {
                    constant = 2.2046e-6
                } else if to == .Ounce {
                    constant = 3.5274e-5
                } else if to == .Ton {
                    constant = 1.1023e-9
                }
            case .Pound:
                if to == .Kilogram {
                    constant = 0.453592
                } else if to == .Gram {
                    constant = 453.592
                } else if to == .Miligram {
                    constant = 453592
                } else if to == .Pound {
                    constant = constant + 0
                } else if to == .Ounce {
                    constant = 16
                } else if to == .Ton {
                    constant = 0.0005
                }
            case .Ounce:
                if to == .Kilogram {
                    constant = 0.0283495
                } else if to == .Gram {
                    constant = 28.3495
                } else if to == .Miligram {
                    constant = 28349.5
                } else if to == .Pound {
                    constant = 0.0625
                } else if to == .Ounce {
                    constant = constant + 0
                } else if to == .Ton {
                    constant = 3.125e-5
                }
            case .Ton:
                if to == .Kilogram {
                    constant = 907.185
                } else if to == .Gram {
                    constant = 907185
                } else if to == .Miligram {
                    constant = 9.072e+8
                } else if to == .Pound {
                    constant = 2000
                } else if to == .Ounce {
                    constant = 32000
                } else if to == .Ton {
                    constant = constant + 0
                }
            }
            
            return constant * val
        }
        
        static func fromString(_ string: String) -> Unit? {
            if string == "Kilogram" {
                return .Kilogram
            } else if string == "Gram" {
                return .Gram
            } else if string == "Miligram" {
                return .Miligram
            } else if string == "Pound" {
                return .Pound
            } else if string == "Ounce" {
                return .Ounce
            } else if string == "Ton" {
                return .Ton
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


