//
//  LengthViewController.swift
//  Converter
//
//  Created by Daniel Jiwani on 6/8/18.
//  Copyright © 2018 Daniel Jiwani. All rights reserved.
//

import UIKit

class LengthViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let list = Unit.allCases()
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var output: UITextField!
    
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
        case Inch = 0, Centimeter, Foot, Meter, Mile, Kilometer, Decimeter, Milimeter, Yard
        
        func description() -> String {
            switch self {
            case .Inch:
                return "Inch"
            case .Centimeter:
                return "Centimeter"
            case .Foot:
                return "Foot"
            case .Meter:
                return "Meter"
            case .Mile:
                return "Mile"
            case .Kilometer:
                return "Kilometer"
            case .Decimeter:
                return "Decimeter"
            case .Milimeter:
                return "Milimeter"
            case .Yard:
                return "Yard"
            }
        }
        
        func convertTo(unit to: Unit, value val: Double) -> Double {
            var constant = 1.0
            switch self {
            case .Inch:
                if to == .Inch {
                    constant = constant + 0
                } else if to == .Centimeter {
                    constant = 2.54
                } else if to == .Foot {
                    constant = 0.08333333
                } else if to == .Meter {
                    constant = 0.0254
                } else if to == .Mile {
                    constant = 1.5783e-5
                } else if to == .Kilometer {
                    constant = 2.54e-5
                } else if to == .Decimeter {
                    constant = 0.254
                } else if to == .Milimeter {
                    constant = 25.4
                } else if to == .Yard {
                    constant = 0.0277778
                }
                
            case .Centimeter:
                if to == .Inch {
                    constant = 0.0393701
                } else if to == .Centimeter {
                    constant = constant + 0
                } else if to == .Foot {
                    constant = 0.0328084
                } else if to == .Meter {
                    constant = 0.01
                } else if to == .Mile {
                    constant = 6.2137e-6
                } else if to == .Kilometer {
                    constant = 1e-5
                } else if to == .Decimeter {
                    constant = 0.1
                } else if to == .Milimeter {
                    constant = 10
                } else if to == .Yard {
                    constant = 0.0109361
                }
                
            case .Foot:
                if to == .Inch {
                    constant = 12;
                } else if to == .Centimeter {
                    constant = 30.48
                } else if to == .Foot {
                    constant = constant + 0
                }else if to == .Meter {
                    constant = 0.3048
                } else if to == .Mile {
                    constant = 0.000189394
                } else if to == .Kilometer {
                    constant = 0.0003048
                } else if to == .Decimeter {
                    constant = 3.048
                } else if to == .Milimeter {
                    constant = 304.8
                } else if to == .Yard {
                    constant = 0.3333333
                }
                
            case .Meter:
                if to == .Inch {
                    constant = 39.3701
                } else if to == .Centimeter {
                    constant = 100
                } else if to == .Foot {
                    constant = 3.28084
                } else if to == .Meter {
                    constant = constant + 0
                } else if to == .Mile {
                    constant = 0.000621371
                } else if to == .Kilometer {
                    constant = 0.001
                } else if to == .Decimeter {
                    constant = 10
                } else if to == .Milimeter {
                    constant = 1000
                } else if to == .Yard {
                    constant = 1.09361
                }
                
            case .Mile:
                if to == .Inch {
                    constant = 63360
                } else if to == .Centimeter {
                    constant = 160934
                } else if to == .Foot {
                    constant = 5280
                } else if to == .Meter {
                    constant = 1609.34
                } else if to == .Mile {
                    constant = constant + 0
                }else if to == .Kilometer {
                    constant = 1.60934
                } else if to == .Decimeter {
                    constant = 16093.4
                } else if to == .Milimeter {
                    constant = 1.609e+6
                } else if to == .Yard {
                    constant = 1760
                }
            case .Kilometer:
                if to == .Inch {
                    constant = 39370.1
                } else if to == .Centimeter {
                    constant = 100000
                } else if to == .Foot {
                    constant = 3280.84
                } else if to == .Meter {
                    constant = 1000
                } else if to == .Mile {
                    constant = 0.621371
                } else if to == .Kilometer {
                    constant = constant + 0
                }else if to == .Decimeter {
                    constant = 10000
                } else if to == .Milimeter {
                    constant = 1e+6
                } else if to == .Yard {
                    constant = 1093.61
                }
            case .Decimeter:
                if to == .Inch {
                    constant = 3.93701
                } else if to == .Centimeter {
                    constant = 10
                } else if to == .Foot {
                    constant = 0.328084
                } else if to == .Meter {
                    constant = 0.1
                } else if to == .Mile {
                    constant = 6.2137e-5
                } else if to == .Kilometer {
                    constant = 1e-4
                } else if to == .Decimeter {
                    constant = constant + 0
                } else if to == .Milimeter {
                    constant = 100
                } else if to == .Yard {
                    constant = 0.109361
                }
            case .Milimeter:
                if to == .Inch {
                    constant = 0.0393701
                } else if to == .Centimeter {
                    constant = 0.1
                } else if to == .Foot {
                    constant = 0.00328084
                } else if to == .Meter {
                    constant = 0.001
                } else if to == .Mile {
                    constant = 6.2137e-7
                } else if to == .Kilometer {
                    constant = 1e-6
                } else if to == .Decimeter {
                    constant = 0.01
                } else if to == .Milimeter {
                    constant = constant + 0
                } else if to == .Yard {
                    constant = 0.00109361
                }
            case .Yard:
                if to == .Inch {
                    constant = 37
                } else if to == .Centimeter {
                    constant = 91.44
                } else if to == .Foot {
                    constant = 3
                } else if to == .Meter {
                    constant = 0.9144
                } else if to == .Mile {
                    constant = 0.000568182
                } else if to == .Kilometer {
                    constant = 0.0009144
                } else if to == .Decimeter {
                    constant = 9.144
                } else if to == .Milimeter {
                    constant = 914.4
                } else if to == .Yard {
                    constant = constant + 0
                }
            }
            
            return constant * val
        }
        
        static func fromString(_ string: String) -> Unit? {
            if string == "Inch" {
                return .Inch
            } else if string == "Centimeter" {
                return .Centimeter
            } else if string == "Foot" {
                return .Foot
            } else if string == "Meter" {
                return .Meter
            } else if string == "Mile" {
                return .Mile
            } else if string == "kilimeter" {
                return .Kilometer
            } else if string == "Decimeter" {
                return .Decimeter
            } else if string == "Milimeter" {
                return .Milimeter
            } else if string == "Yard" {
                return .Yard
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


