//
//  SpeedViewController.swift
//  Converter
//
//  Created by Daniel Jiwani on 6/8/18.
//  Copyright © 2018 Daniel Jiwani. All rights reserved.
//

import UIKit

class SpeedViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
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
        case Knot = 0, KPH, MPS, FPS, MPH, Sound, Light
        
        func description() -> String {
            switch self {
            case .Knot:
                return "Knot"
            case .KPH:
                return "Kilometer per Hour"
            case .MPS:
                return "Meters per Second"
            case .FPS:
                return "Feet Per Second"
            case .MPH:
                return "Miles per Hour"
            case .Sound:
                return "Speed of Sound"
            case .Light:
                return "Speed of Light"
            }
        }
        
        func convertTo(unit to: Unit, value val: Double) -> Double {
            var constant = 1.0
            switch self {
            case .Knot:
                if to == .Knot {
                    constant = constant + 0
                } else if to == .KPH {
                    constant = 1.852
                } else if to == .MPS {
                    constant = 0.514444
                } else if to == .FPS {
                    constant = 1.68781
                } else if to == .MPH {
                    constant = 1.15078
                } else if to == .Sound {
                    constant = 0.00149984
                } else if to == .Light {
                    constant = 1.716e-9
                }
            
            case .KPH:
                if to == .Knot {
                    constant = 0.539957
                } else if to == .KPH {
                    constant = constant + 0
                } else if to == .MPS {
                    constant = 0.277778
                } else if to == .FPS {
                    constant = 0.911344
                } else if to == .MPH {
                    constant = 0.621371
                } else if to == .Sound {
                    constant = 0.00149984
                } else if to == .Light {
                    constant = 9.2657e-10
                }
            
            case .MPS:
                if to == .Knot {
                    constant = 1.94384
                } else if to == .KPH {
                    constant = 3.6
                } else if to == .MPS {
                    constant = constant + 0
                } else if to == .FPS {
                    constant = 3.28084
                } else if to == .MPH {
                    constant = 2.23694
                } else if to == .Sound {
                    constant = 0.00291545
                } else if to == .Light {
                    constant = 3.3356e-9
                }
            
            case .FPS:
                if to == .Knot {
                    constant = 0.592484
                } else if to == .KPH {
                    constant = 1.09728
                } else if to == .MPS {
                    constant = 0.3048
                } else if to == .FPS {
                    constant = constant + 0
                } else if to == .MPH {
                    constant = 0.681818
                } else if to == .Sound {
                    constant = 0.00088863
                } else if to == .Light {
                    constant = 1.0167e-9
                }
            
            case .MPH:
                if to == .Knot {
                    constant = 0.868976
                } else if to == .KPH {
                    constant = 1.60934
                } else if to == .MPS {
                    constant = 0.44704
                } else if to == .FPS {
                    constant = 1.46667
                } else if to == .MPH {
                    constant = constant + 0
                } else if to == .Sound {
                    constant = 0.00130332
                } else if to == .Light {
                    constant = 1.4912e-9
                }
            
            case .Sound:
                if to == .Knot {
                    constant = 666.739
                } else if to == .KPH {
                    constant = 1234.8
                } else if to == .MPS {
                    constant = 343
                } else if to == .FPS {
                    constant = 1125.33
                } else if to == .MPH {
                    constant = 767.269
                } else if to == .Sound {
                    constant = constant + 0
                } else if to == .Light {
                    constant = 1.14412e-6
                }
            
            case .Light:
                if to == .Knot {
                    constant = 5.827e+8
                } else if to == .KPH {
                    constant = 1.079e+9
                } else if to == .MPS {
                    constant = 2.998e+8
                } else if to == .FPS {
                    constant = 9.836e+8
                } else if to == .MPH {
                    constant = 6.706e+8
                } else if to == .Sound {
                    constant = 874030
                } else if to == .Light {
                    constant = constant + 0
                }
            }
            return constant * val
        }
        
        static func fromString(_ string: String) -> Unit? {
            if string == "Knot" {
                return .Knot
            } else if string == "Kilometer per Hour" {
                return .KPH
            } else if string == "Meters per Hour" {
                return .MPS
            } else if string == "Feet per Second" {
                return .FPS
            } else if string == "Miles per Hour" {
                return .MPH
            } else if string == "Speed of Sound" {
                return .Sound
            } else if string == "Speed of Light" {
                return .Light
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


