//
//  DataViewController.swift
//  Converter
//
//  Created by Daniel Jiwani on 6/8/18.
//  Copyright © 2018 Daniel Jiwani. All rights reserved.
//

import UIKit

class DataViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let list = Unit.allCases()
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var output: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    
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
        case Bit = 0, Byte, Kilobyte, Megabyte, Gigabyte, Terabyte, Petabyte
        
        func description() -> String {
            switch self {
            case .Bit:
                return "Bit"
            case .Byte:
                return "Byte"
            case .Kilobyte:
                return "Kilobyte"
            case .Megabyte:
                return "Megabyte"
            case .Gigabyte:
                return "Gigabyte"
            case .Terabyte:
                return "Terabyte"
            case .Petabyte:
                return "Petabyte"
            }
        }
        
        func convertTo(unit to: Unit, value val: Double) -> Double {
            var constant = 1.0
            switch self {
            case .Bit:
                if to == .Bit {
                    constant = constant + 0
                } else if to == .Byte {
                    constant = 0.125
                } else if to == .Kilobyte {
                    constant = 0.000125
                } else if to == .Megabyte {
                    constant = 0.000000125
                } else if to == .Gigabyte {
                    constant = 0.000000000125
                } else if to == .Terabyte {
                    constant = 0.000000000000125
                } else if to == .Petabyte {
                    constant = 0.000000000000000125
                }
            
            case .Byte:
                if to == .Bit {
                    constant = 8
                } else if to == .Byte {
                    constant = constant + 0
                } else if to == .Kilobyte {
                    constant = 0.001
                } else if to == .Megabyte {
                    constant = 0.0000010
                } else if to == .Gigabyte {
                    constant = 0.0000000010
                } else if to == .Terabyte {
                    constant = 0.0000000000010
                } else if to == .Petabyte {
                    constant = 0.0000000000000010
                }
            case .Kilobyte:
                if to == .Bit {
                    constant = 8000
                } else if to == .Byte {
                    constant = 1000
                } else if to == .Kilobyte {
                    constant = constant + 0
                } else if to == .Megabyte {
                    constant = 0.001
                } else if to == .Gigabyte {
                    constant = 0.0000010
                } else if to == .Terabyte {
                    constant = 0.0000000010
                } else if to == .Petabyte {
                    constant = 0.0000000000010
                }
            
            case .Megabyte:
                if to == .Bit {
                    constant = 8000000
                } else if to == .Byte {
                    constant = 1000000
                } else if to == .Kilobyte {
                    constant = 1000
                } else if to == .Megabyte {
                    constant = constant + 0
                } else if to == .Gigabyte {
                    constant = 0.001
                } else if to == .Terabyte {
                    constant = 0.0000010
                } else if to == .Petabyte {
                    constant = 0.0000000010
                }
            
            case .Gigabyte:
                if to == .Bit {
                    constant = 8000000000
                } else if to == .Byte {
                    constant = 1000000000
                } else if to == .Kilobyte {
                    constant = 1000000
                } else if to == .Megabyte {
                    constant = 1000
                } else if to == .Gigabyte {
                    constant = constant + 0
                } else if to == .Terabyte {
                    constant = 0.001
                } else if to == .Petabyte {
                    constant = 0.0000010
                }
                
            case .Terabyte:
                if to == .Bit {
                    constant = 8000000000000
                } else if to == .Byte {
                    constant = 1000000000000
                } else if to == .Kilobyte {
                    constant = 1000000000
                } else if to == .Megabyte {
                    constant = 1000000
                } else if to == .Gigabyte {
                    constant = 1000
                } else if to == .Terabyte {
                    constant = constant + 0
                } else if to == .Petabyte {
                    constant = 0.001
                }
            
            case .Petabyte:
                if to == .Bit {
                    constant = 8000000000000000
                } else if to == .Byte {
                    constant = 1000000000000000
                } else if to == .Kilobyte {
                    constant = 1000000000000
                } else if to == .Megabyte {
                    constant = 1000000000
                } else if to == .Gigabyte {
                    constant = 1000000
                } else if to == .Terabyte {
                    constant = 1000
                } else if to == .Petabyte {
                    constant = constant + 0
                }
            }
            return constant * val
        }
        
        static func fromString(_ string: String) -> Unit? {
            if string == "Bit" {
                return .Bit
            } else if string == "Byte" {
                return .Byte
            } else if string == "Kilobyte" {
                return .Kilobyte
            } else if string == "Megabyte" {
                return .Megabyte
            } else if string == "Gigabyte" {
                return .Gigabyte
            } else if string == "Terabyte" {
                return .Terabyte
            } else if string == "Petabyte" {
                return .Petabyte
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


